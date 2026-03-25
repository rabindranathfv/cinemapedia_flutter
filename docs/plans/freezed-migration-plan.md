# Freezed Domain Models — Migration Plan

> **Last updated:** 2026-03-25 | **Status:** ✅ COMPLETE (S1 ✅, S2 ✅, S3 ✅, S4 ✅)

## Summary

This plan migrates all hand-written domain entities and infrastructure models to use the [`@freezed`](https://pub.dev/packages/freezed) package, following the standard established in [freezed-domain-models.md](../freezed-domain-models.md).

Currently, every model in the project is a plain Dart class with manually written `fromJson`/`toJson`, no `copyWith`, and reference-based equality. Freezed eliminates this boilerplate and provides:

1. **Immutable models with `copyWith`** — safe state updates in providers and tests
2. **Value equality** — `==` and `hashCode` based on field values, not identity
3. **Generated serialization** — no hand-maintained `fromJson`/`toJson`
4. **Compile-time safety** — required fields enforced, no silent nullability bugs

The work spans 4 vertical slices covering `pubspec.yaml` setup, domain entities, infrastructure models, and cleanup of now-redundant mapper code.

---

## Current State Analysis

### Domain Entities (`lib/domain/entities/`)

| Entity  | Fields       | Has serialization             | Has computed getters                       | Notes                        |
| ------- | ------------ | ----------------------------- | ------------------------------------------ | ---------------------------- |
| `Movie` | 14           | ✅ Manual `fromJson`/`toJson` | ❌                                         | `genreIds: List<String>`     |
| `Actor` | 4            | ❌                            | ❌                                         | `character` is nullable      |
| `Genre` | 2 + computed | ❌                            | ✅ `icon`, `description`, `gradientColors` | Requires private constructor |
| `Video` | 7 + computed | ❌                            | ✅ `youtubeThumbUrl`                       | Requires private constructor |

### Infrastructure Models (`lib/infraestructure/models/moviedb/`)

| Model             | Fields             | Has serialization | Notes                      |
| ----------------- | ------------------ | ----------------- | -------------------------- |
| `MovieMovieDB`    | ~14                | ✅ Manual         | `genreIds: List<int>`      |
| `MovieDbResponse` | 4 + `Dates` nested | ✅ Manual         | Wraps `List<MovieMovieDB>` |
| `MovieDetails`    | ~20 + nested types | ✅ Manual         | Several nested classes     |
| `CreditsResponse` | 3 + `Cast` nested  | ✅ Manual         | `Cast` has 14 fields       |
| `GenreMovieDB`    | 2                  | ✅ Manual         | Simple lookup model        |
| `VideoMovieDB`    | 10                 | ✅ Manual         | Maps 1:1 to `Video` entity |

### Dependencies (current `pubspec.yaml`)

| Package                   | Present            | Version needed    |
| ------------------------- | ------------------ | ----------------- |
| `freezed_annotation`      | ❌                 | `^3.1.0`          |
| `freezed` (dev)           | ❌                 | `^3.2.3`          |
| `json_serializable` (dev) | ❌                 | `^6.11.1`         |
| `build_runner` (dev)      | ✅ already present | already `^2.4.11` |

---

## Implementation Plan

### Vertical Slices

| Slice  | Description                    | Parts                                                         | Demo                                                       | Status      |
| ------ | ------------------------------ | ------------------------------------------------------------- | ---------------------------------------------------------- | ----------- |
| **S1** | Setup & tooling                | Add deps, verify codegen pipeline                             | `flutter pub get` + `dart run build_runner build` succeeds | ✅ Complete |
| **S2** | Domain entity migration        | Convert `Movie`, `Actor`, `Genre`, `Video` to `@freezed`      | App runs; providers still work; equality works in tests    | ✅ Complete |
| **S3** | Infrastructure model migration | Convert all `moviedb/` models to `@freezed`                   | Mappers compile; API responses deserialize correctly       | ✅ Complete |
| **S4** | Mapper & serialization cleanup | Remove redundant manual `fromJson`/`toJson`; simplify mappers | No hand-written serialization remains                      | ✅ Complete |

### Slice Dependencies

```
S1 ──→ S2 ──→ S4
 │
 └──→ S3 ──→ S4
```

- **S1** must be first — all other slices require the packages and working codegen
- **S2** and **S3** are independent after S1 and can be done in parallel
- **S4** consolidates and cleans up once S2 and S3 are stable

---

## Suggested Phasing

| Phase | Description                                 | Slices | Risk                                               |
| ----- | ------------------------------------------- | ------ | -------------------------------------------------- | ----------- |
| **1** | Add packages, verify build pipeline         | S1     | Low                                                | ✅ Complete |
| **2** | Migrate domain entities                     | S2     | Medium — computed getters need private constructor | ✅ Complete |
| **3** | Migrate infrastructure models               | S3     | Medium — nested models require ordering            | ✅ Complete |
| **4** | Cleanup mappers and dead serialization code | S4     | Low                                                | ✅ Complete |

---

## S1 — Setup & Tooling

### Tasks

- [x] Add `freezed_annotation: ^3.1.0` to `dependencies` in `pubspec.yaml`
- [x] Add `freezed: ^3.2.3` to `dev_dependencies` in `pubspec.yaml`
- [x] Add `json_serializable: ^6.11.1` to `dev_dependencies` in `pubspec.yaml`
- [x] Move `build_runner` from `dependencies` to `dev_dependencies`
- [x] Run `flutter pub get`
- [x] Verify `dart run build_runner build --delete-conflicting-outputs` completes without errors

### Expected `pubspec.yaml` additions

```yaml
dependencies:
  freezed_annotation: ^3.1.0

dev_dependencies:
  freezed: ^3.2.3
  json_serializable: ^6.11.1
```

---

## S2 — Domain Entity Migration

### 2A: `Movie` entity

**File:** `lib/domain/entities/movie.dart`

Simple model — no computed getters, no private constructor needed.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required bool adult,
    required String backdropPath,
    required List<String> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
```

### 2B: `Actor` entity

**File:** `lib/domain/entities/actor.dart`

Minimal model with one nullable field.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
abstract class Actor with _$Actor {
  const factory Actor({
    required int id,
    required String name,
    required String profilePath,
    String? character,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
```

### 2C: `Genre` entity

**File:** `lib/domain/entities/genre.dart`

Has computed getters (`icon`, `description`, `gradientColors`) — requires private constructor.

```dart
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  // Required for custom getters
  const Genre._();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  IconData get icon { /* ... keep existing logic ... */ }
  String get description { /* ... keep existing logic ... */ }
  List<Color> get gradientColors { /* ... keep existing logic ... */ }
}
```

### 2D: `Video` entity

**File:** `lib/domain/entities/video.dart`

Has computed getter `youtubeThumbUrl` — requires private constructor.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
abstract class Video with _$Video {
  const factory Video({
    required String id,
    required String name,
    required String key,
    required String site,
    required String type,
    required bool official,
    required String publishedAt,
  }) = _Video;

  // Required for custom getters
  const Video._();

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  String get youtubeThumbUrl => 'https://img.youtube.com/vi/$key/mqdefault.jpg';
}
```

---

## S3 — Infrastructure Model Migration

Migrate in dependency order (simplest/no-nested first):

### 3A: `GenreMovieDB`

**File:** `lib/infraestructure/models/moviedb/genre_moviedb.dart`
Simple 2-field model, no nesting.

### 3B: `VideoMovieDB`

**File:** `lib/infraestructure/models/moviedb/video_moviedb.dart`
10 fields, no nesting.

### 3C: `MovieMovieDB`

**File:** `lib/infraestructure/models/moviedb/movie_moviedb.dart`
~14 fields. `genreIds` is `List<int>`. No nesting.

### 3D: `MovieDbResponse` + `Dates`

**File:** `lib/infraestructure/models/moviedb/moviedb_response.dart`
Wraps `List<MovieMovieDB>` — must be migrated after 3C.

### 3E: `MovieDetails` and nested types

**File:** `lib/infraestructure/models/moviedb/movie_details.dart`
Most complex: ~20 fields with several nested classes (`Genre`, `ProductionCompany`, etc.). Migrate each nested type as a separate `@freezed` class in the same file or individual files.

### 3F: `CreditsResponse` + `Cast`

**File:** `lib/infraestructure/models/moviedb/credits_response.dart`
`Cast` has 14 fields. `CreditsResponse` wraps `List<Cast>`.

---

## S4 — Mapper & Serialization Cleanup

Once all models are `@freezed`:

- [x] Remove hand-written `fromJson`/`toJson` from the original entity files (now generated)
- [x] Verify mappers (`MovieMapper`, `ActorMapper`, `GenreMapper`, `VideoMapper`) still compile — field names should be identical
- [x] Remove dead `hide Genre` import filter from `moviedb_datasource.dart` (class renamed to `MovieDetailsGenre` in S3)
- [x] Remove debug `print` statements from `movies_favorites_provider.dart`
- [x] Run `dart run build_runner build --delete-conflicting-outputs` to regenerate all `.g.dart` files
- [x] Run the app and verify all screens render correctly

---

## Key Risks

| Risk   | Description                                                                 | Mitigation                                                                                                                     |
| ------ | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| **R1** | Freezed `@freezed` on `Genre`/`Video` breaks computed getters               | Use `const MyModel._();` private constructor — documented in [freezed-domain-models.md](../freezed-domain-models.md#example-3) |
| **R2** | `MovieDetails` nested types ordering causes build errors                    | Migrate bottom-up: leaf types first, then parent models                                                                        |
| **R3** | `genreIds: List<int>` in `MovieMovieDB` vs `List<String>` in `Movie` entity | No change needed — mappers still handle the conversion; types stay as-is                                                       |
| **R4** | Riverpod providers caching stale model instances after equality change      | Value equality from freezed may invalidate caches correctly — test provider rebuilds after migration                           |
| **R5** | `part` directive conflicts if a file already has other `part` uses          | Check each file before adding — none currently have `part` directives                                                          |

---

## Testing Considerations

| Area                     | What to Test                                                                      |
| ------------------------ | --------------------------------------------------------------------------------- |
| **Serialization**        | `Movie.fromJson(json).toJson() == json` round-trips correctly                     |
| **Equality**             | Two `Movie` instances with same fields are `==`                                   |
| **copyWith**             | `movie.copyWith(title: 'New')` returns correct updated instance                   |
| **Computed getters**     | `Genre.icon`, `Video.youtubeThumbUrl` still return correct values after migration |
| **Mapper output**        | `MovieMapper.movieDBtoEntity()` and `MovieDetailsToEntity()` still map all fields |
| **Provider integration** | Existing Riverpod providers compile and return correct types                      |

### Commands

```bash
# Regenerate all codegen files
dart run build_runner build --delete-conflicting-outputs

# Run tests (if any exist)
flutter test

# Run app to validate end-to-end
flutter run
```

---

## Next Steps

1. **S1** — Add `freezed_annotation`, `freezed`, `json_serializable` to `pubspec.yaml` and verify build
2. **S2** — Migrate domain entities starting with `Movie` (simplest), then `Actor`, then `Genre` and `Video` (computed getters)
3. **S3** — Migrate infrastructure models in dependency order (3A → 3B → 3C → 3D → 3E → 3F)
4. **S4** — Remove dead serialization code and verify app runs cleanly
