# Riverpod Codegen Migration — Plan

> **Last updated:** 2026-03-25 | **Status:** ✅ COMPLETE (S1 ✅, S2 ✅, S3 ✅, S4 ✅, S5 ✅, S6 ✅)

## Summary

This plan migrates all hand-declared Riverpod providers to use `@riverpod` code generation (`riverpod_generator`), following the standard established in [riverpod-providers.md](../riverpod-providers.md).

Currently, every provider in the project is declared manually using `NotifierProvider(...)`, `Provider(...)`, `FutureProvider(...)`, or legacy `StateNotifierProvider(...)` / `StateProvider(...)`. Two provider files still depend on `flutter_riverpod/legacy.dart`, which is deprecated in Riverpod 3.x. Migrating to codegen provides:

1. **Type-safe, boilerplate-free declarations** — `@riverpod` annotation generates providers automatically
2. **No manual provider wiring** — No more `NotifierProvider<Notifier, State>(Notifier.new)` declarations
3. **Lint enforcement** — `riverpod_lint` catches anti-patterns at analysis time
4. **Consistency with the codebase standard** — Aligns all providers with `riverpod-providers.md`

The work spans 6 vertical slices covering pubspec cleanup, simple providers, movie list notifiers, map-keyed notifiers, legacy migration, and final cleanup.

---

## Current State Analysis

### Provider Files (`lib/presentation/screen/providers/`)

| File                                                  | Provider                                                 | Current API                                            | Pattern | Issues                                                                  |
| ----------------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------------ | ------- | ----------------------------------------------------------------------- |
| `movies/movies_repository_provider.dart`              | `movieRepositoryProvider`                                | `Provider`                                             | Manual  | No codegen                                                              |
| `actors/actors_repository_provider.dart`              | `actorsRepositoryProvider`                               | `Provider`                                             | Manual  | No codegen                                                              |
| `shared_preferences/shared_preferences_provider.dart` | `sharedPreferencesProvider`                              | `FutureProvider`                                       | Manual  | No codegen; `ref.read(.future)` in `build()`                            |
| `movies/movies_slideshow_provider.dart`               | `moviesSlideshowProvider`                                | `Provider` (derived)                                   | Manual  | No codegen                                                              |
| `movies/movies_providers.dart`                        | `nowPlaying/popular/topRated/upcomingMoviesProvider` (4) | `NotifierProvider`                                     | Manual  | No codegen; 4 classes in one file                                       |
| `movies/genres_provider.dart`                         | `genresProvider`, `moviesByGenreProvider`                | `NotifierProvider` (2)                                 | Manual  | No codegen; 2 classes in one file                                       |
| `movies/movies_info_provider.dart`                    | `movieInfoProvider`                                      | `NotifierProvider`                                     | Manual  | No codegen                                                              |
| `movies/movie_videos_provider.dart`                   | `movieVideosProvider`                                    | `NotifierProvider`                                     | Manual  | No codegen                                                              |
| `movies/similar_movies_provider.dart`                 | `similarMoviesProvider`                                  | `NotifierProvider`                                     | Manual  | No codegen                                                              |
| `movies/movies_favorites_provider.dart`               | `favoritesMoviesProvider`                                | `NotifierProvider`                                     | Manual  | No codegen; missing `keepAlive: true`                                   |
| `actors/actors_by_movie_provider.dart`                | `actorsByMovieProvider`                                  | **`StateNotifierProvider` (LEGACY)**                   | Legacy  | Imports `flutter_riverpod/legacy.dart`                                  |
| `search/search_movies_provider.dart`                  | `searchMoviesProvider`, `searchQueryProvider`            | **`StateNotifierProvider` + `StateProvider` (LEGACY)** | Legacy  | Imports `flutter_riverpod/legacy.dart`; `ref` passed as constructor arg |

### Dependencies (current `pubspec.yaml`)

| Package               | Present           | Section            | Action needed              |
| --------------------- | ----------------- | ------------------ | -------------------------- |
| `flutter_riverpod`    | ✅ `^3.0.0-dev.3` | `dependencies`     | None                       |
| `riverpod_annotation` | ✅ `^4.0.0`       | `dependencies`     | None                       |
| `riverpod_generator`  | ✅ `^4.0.0+1`     | `dependencies` ⚠️  | Move to `dev_dependencies` |
| `riverpod_lint`       | ✅ `^3.0.0-dev.4` | `dependencies` ⚠️  | Move to `dev_dependencies` |
| `build_runner`        | ✅ `^2.4.11`      | `dev_dependencies` | None                       |

### Anti-patterns Identified

| File                             | Anti-pattern                                                  | Fix                                                         |
| -------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------- |
| `actors_by_movie_provider.dart`  | Legacy `StateNotifier` + `flutter_riverpod/legacy.dart`       | Replace with `@riverpod Notifier`                           |
| `search_movies_provider.dart`    | Legacy `StateNotifier` + `ref` as constructor arg             | Replace with `@riverpod Notifier`; use `ref` from `build()` |
| `search_movies_provider.dart`    | Legacy `StateProvider`                                        | Replace with `@riverpod Notifier<String>`                   |
| `movies_favorites_provider.dart` | No `keepAlive` on persistent-state provider                   | Add `@Riverpod(keepAlive: true)`                            |
| `home_view.dart`                 | `ref.read(sharedPreferencesProvider.future)` inside `build()` | Replace with `ref.watch()` or move to `initState()`         |
| `pubspec.yaml`                   | `riverpod_generator` + `riverpod_lint` in `dependencies`      | Move to `dev_dependencies`                                  |
| `providers.dart` barrel          | Missing exports for `search/` and `shared_preferences/`       | Add missing exports                                         |

---

## Implementation Plan

### Vertical Slices

| Slice  | Description                     | Parts                                                                         | Demo                                                       | Status      |
| ------ | ------------------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------------------- | ----------- |
| **S1** | Fix pubspec & verify pipeline   | Fix deps section, run codegen                                                 | `flutter pub get` + `dart run build_runner build` succeeds | ✅ Complete |
| **S2** | Repository & utility providers  | `movieRepository`, `actorsRepository`, `sharedPreferences`, `moviesSlideshow` | All 4 providers codegen-declared; app compiles             | ✅ Complete |
| **S3** | Movie list & genre notifiers    | `nowPlaying`, `popular`, `topRated`, `upcoming`, `genres`, `moviesByGenre`    | Home view loads; pagination still works                    | ✅ Complete |
| **S4** | Map-keyed & favorites notifiers | `movieInfo`, `movieVideos`, `similarMovies`, `favorites`                      | Movie detail screen loads; favorites persist               | ✅ Complete |
| **S5** | Legacy provider migration       | `actorsByMovie`, `searchMovies`, `searchQuery`                                | Search works; actors load; no legacy imports left          | ✅ Complete |
| **S6** | Cleanup                         | Barrel file, anti-pattern fixes, final build                                  | `riverpod_lint` reports no warnings                        | ✅ Complete |

### Slice Dependencies

```
S1 ──→ S2 ──→ S3 ──→ S6
        │
        └──→ S4 ──→ S6
        │
        └──→ S5 ──→ S6
```

- **S1** must be first — codegen must be verified before any annotations are added
- **S2** is the foundation for all notifier slices — notifiers depend on repository providers
- **S3**, **S4**, **S5** are independent after S2 and can be done in any order
- **S6** consolidates once S3, S4, and S5 are all stable

---

## Suggested Phasing

| Phase | Description                                    | Slices | Risk     | Status      |
| ----- | ---------------------------------------------- | ------ | -------- | ----------- |
| **1** | Fix pubspec; verify build pipeline             | S1     | Low      | ✅ Complete |
| **2** | Migrate repository & utility providers         | S2     | Low      | ✅ Complete |
| **3** | Migrate movie list & genre notifiers           | S3     | Medium   | ✅ Complete |
| **4** | Migrate map-keyed notifiers + favorites        | S4     | Medium   | ✅ Complete |
| **5** | Migrate legacy `StateNotifier` providers       | S5     | **High** | ✅ Complete |
| **6** | Barrel cleanup, lint fixes, final verification | S6     | Low      | ✅ Complete |

---

## S1 — Fix pubspec & Verify Pipeline

### Tasks

- [x] Move `riverpod_generator: ^4.0.0+1` from `dependencies` to `dev_dependencies`
- [x] Move `riverpod_lint: ^3.0.0-dev.4` from `dependencies` to `dev_dependencies`
- [x] Run `flutter pub get`
- [x] Run `dart run build_runner build --delete-conflicting-outputs` — completed in 10s; 0 new outputs (expected); pipeline verified ✅

### Expected `pubspec.yaml` after S1

```yaml
dependencies:
  flutter_riverpod: ^3.0.0-dev.3
  riverpod_annotation: ^4.0.0

dev_dependencies:
  build_runner: ^2.4.11
  riverpod_generator: ^4.0.0+1
  riverpod_lint: ^3.0.0-dev.4
```

---

## S2 — Repository & Utility Providers

Migrate the four stateless providers. These have no complex state — just plain function-based `@riverpod`. Naming convention: function name = provider name target minus `Provider` suffix.

### 2A: `movieRepositoryProvider`

**File:** `lib/presentation/screen/providers/movies/movies_repository_provider.dart`

```dart
import 'package:cinemapedia_flutter/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_flutter/infraestructure/repositories/movie_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia_flutter/domain/repositories/movies_repository.dart';

part 'movies_repository_provider.g.dart';

@Riverpod(keepAlive: true)
MoviesRepository movieRepository(Ref ref) {
  return MovieRepositoryImpl(datasource: MoviedbDatasource());
}
```

> `keepAlive: true` — repository instances should never be disposed.

### 2B: `actorsRepositoryProvider`

**File:** `lib/presentation/screen/providers/actors/actors_repository_provider.dart`

```dart
import 'package:cinemapedia_flutter/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia_flutter/infraestructure/repositories/actor_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia_flutter/domain/repositories/actors_repository.dart';

part 'actors_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ActorsRepository actorsRepository(Ref ref) {
  return ActorRepositoryImpl(datasource: ActorMoviedbDatasource());
}
```

### 2C: `sharedPreferencesProvider`

**File:** `lib/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart`

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return SharedPreferences.getInstance();
}
```

> Convert `ref.read(sharedPreferencesProvider.future)` inside `build()` in `home_view.dart` to `ref.watch()`.

### 2D: `moviesSlideshowProvider`

**File:** `lib/presentation/screen/providers/movies/movies_slideshow_provider.dart`

```dart
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_slideshow_provider.g.dart';

@riverpod
List<Movie> moviesSlideshow(Ref ref) {
  final nowPlaying = ref.watch(nowPlayingMoviesProvider);
  if (nowPlaying.isEmpty) return [];
  return nowPlaying.sublist(0, 6);
}
```

---

## S3 — Movie List & Genre Notifiers

Six notifiers that manage paginated lists. Currently 4 are in one file (`movies_providers.dart`) and 2 are in `genres_provider.dart`. Split each notifier into its own file to follow the one-provider-per-file convention from `riverpod-providers.md`.

**Naming:** Class name → provider name target.

| Target provider name       | New class name     | File                                      |
| -------------------------- | ------------------ | ----------------------------------------- |
| `nowPlayingMoviesProvider` | `NowPlayingMovies` | `movies/now_playing_movies_provider.dart` |
| `popularMoviesProvider`    | `PopularMovies`    | `movies/popular_movies_provider.dart`     |
| `topRatedMoviesProvider`   | `TopRatedMovies`   | `movies/top_rated_movies_provider.dart`   |
| `upcomingMoviesProvider`   | `UpcomingMovies`   | `movies/upcoming_movies_provider.dart`    |
| `genresProvider`           | `Genres`           | `movies/genres_provider.dart`             |
| `moviesByGenreProvider`    | `MoviesByGenre`    | `movies/movies_by_genre_provider.dart`    |

**Example — `NowPlayingMovies`:**

```dart
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'now_playing_movies_provider.g.dart';

@Riverpod(keepAlive: true)
class NowPlayingMovies extends _$NowPlayingMovies {
  int _currentPage = 0;
  bool _isLoading = false;

  @override
  List<Movie> build() => [];

  Future<void> loadNextPage() async {
    if (_isLoading) return;
    _isLoading = true;
    _currentPage++;
    final movies = await ref
        .read(movieRepositoryProvider)
        .getNowPlaying(page: _currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    _isLoading = false;
  }
}
```

> All four list notifiers follow the same structure; only the repository method differs. `keepAlive: true` is required — these lists must survive widget disposal (used by home view and slideshow).

**Delete** `movies_providers.dart` after splitting.

---

## S4 — Map-keyed & Favorites Notifiers

Four notifiers that use `Map<String, T>` as state (one entry per movie ID).

| Target provider name      | New class name    | Notes                                                      |
| ------------------------- | ----------------- | ---------------------------------------------------------- |
| `movieInfoProvider`       | `MovieInfo`       | **`keepAlive: true`** — cache survives navigation          |
| `movieVideosProvider`     | `MovieVideos`     | **`keepAlive: true`** — cache survives navigation          |
| `similarMoviesProvider`   | `SimilarMovies`   | **`keepAlive: true`** — cache survives navigation          |
| `favoritesMoviesProvider` | `FavoritesMovies` | **`keepAlive: true`** — persistent SharedPreferences state |

**Example — `MovieInfo`:**

```dart
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_info_provider.g.dart';

@riverpod
class MovieInfo extends _$MovieInfo {
  @override
  Map<String, Movie> build() => {};

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await ref.read(movieRepositoryProvider).getMovieById(movieId);
    state = {...state, movieId: movie};
  }
}
```

**`FavoritesMovies` — add `keepAlive`:**

```dart
@Riverpod(keepAlive: true)
class FavoritesMovies extends _$FavoritesMovies {
  // ... existing body unchanged, just add keepAlive and codegen parts
}
```

---

## S5 — Legacy Provider Migration

These files import `flutter_riverpod/legacy.dart` and use deprecated classes. Full structural changes are needed.

### 5A: `actorsByMovieProvider`

**File:** `lib/presentation/screen/providers/actors/actors_by_movie_provider.dart`

**Before:** `StateNotifierProvider` + `StateNotifier` + dependency injected via constructor.

**After:** `@riverpod Notifier` — repository accessed via `ref.read()` inside the method:

```dart
import 'package:cinemapedia_flutter/domain/entities/actor.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/actors/actors_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_by_movie_provider.g.dart';

@riverpod
class ActorsByMovie extends _$ActorsByMovie {
  @override
  Map<String, List<Actor>> build() => {};

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await ref
        .read(actorsRepositoryProvider)
        .getActorsByMovieId(movieId);
    state = {...state, movieId: actors};
  }
}
```

> **Key change:** Remove `GetArctorsCallback` typedef and constructor injection. Remove `flutter_riverpod/legacy.dart` import.

### 5B: `searchMoviesProvider` + `searchQueryProvider`

**File:** `lib/presentation/screen/providers/search/search_movies_provider.dart`

**Before:** `StateNotifierProvider` (ref in constructor) + `StateProvider<String>`.

**After:** Two `@riverpod` classes:

```dart
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_provider.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
}

@riverpod
class SearchMovies extends _$SearchMovies {
  @override
  List<Movie> build() => [];

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movies = await ref
        .read(movieRepositoryProvider)
        .searchMovies(query);
    ref.read(searchQueryProvider.notifier).update(query);
    state = movies;
    return movies;
  }
}
```

> **Key changes:** Remove `ref` constructor arg from notifier. Access `ref` via the `_$SearchMovies` base class. Remove `flutter_riverpod/legacy.dart` import. Update `SearchMovieDelegate` consumer: `ref.read(searchQueryProvider.notifier).update(query)` instead of `.update((state) => query)`.

---

## S6 — Cleanup

Once all slices are stable:

- [x] Update `providers.dart` barrel — added exports for `search/search_movies_provider.dart` (S5) and `shared_preferences/shared_preferences_provider.dart`; `movies/movies_providers.dart` gutted to stub
- [x] Delete `movies/movies_providers.dart` (replaced by 4 individual files in S3) — file reduced to single comment stub
- [x] Remove `flutter_riverpod/legacy.dart` imports from all remaining files — zero legacy imports remaining (`grep` confirms)
- [x] Fix `home_view.dart`: removed `ref.read(sharedPreferencesProvider.future)` unused variable; removed stale direct imports now covered by barrel
- [x] Fix `movie_masonry.dart`: removed unused direct import of `movies_favorites_provider.dart`
- [x] Fix `custom_appbar.dart`: removed unused direct import of `movies_repository_provider.dart`
- [x] Suppressed `invalid_annotation_target` in `analysis_options.yaml` (known false-positive with freezed + json_annotation)
- [x] Run `dart run build_runner build --delete-conflicting-outputs` ✅
- [x] Run `flutter build ios --no-codesign` — ✅ 23.2s, 16.9MB
- [x] Review `riverpod_lint` diagnostics — zero migration-related warnings remain

---

## Key Risks

| Risk   | Description                                                                       | Mitigation                                                                                                        |
| ------ | --------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **R1** | Generated provider names differ from manual names                                 | Name codegen classes to match target: `NowPlayingMovies` → `nowPlayingMoviesProvider`; verify each consumer       |
| **R2** | `StateNotifier` refactor in S5 breaks `SearchMovieDelegate` init                  | `SearchedMoviesNotifier` currently accepts `ref` in constructor — remove and use `ref` from codegen base class    |
| **R3** | `favoritesMoviesProvider` loses state after adding `keepAlive`                    | `keepAlive` prevents disposal — state is retained; no data loss expected                                          |
| **R4** | Splitting `movies_providers.dart` into 4 files creates circular imports           | Import chain: slideshow → nowPlaying → movieRepository. Resolve by ensuring each file imports only its direct dep |
| **R5** | `sharedPreferencesProvider` is `AsyncValue` — consumers must handle loading state | Fix `ref.read(sharedPreferencesProvider.future)` in `build()` — move to `initState()` or wrap with `when()`       |
| **R6** | `build_runner` generates conflicting outputs if old generated files exist         | Always run with `--delete-conflicting-outputs`                                                                    |

---

## Testing Considerations

| Area                     | What to Test                                                                                           |
| ------------------------ | ------------------------------------------------------------------------------------------------------ |
| **Repository providers** | `ref.watch(movieRepositoryProvider)` returns non-null instance; type is `MoviesRepository`             |
| **Pagination**           | `loadNextPage()` appends movies; calling `loadNextPage()` twice in fast succession doesn't double-load |
| **Map-keyed notifiers**  | `loadMovie(id)` called twice doesn't trigger second API call (cache guard)                             |
| **Favorites**            | `toggleFavorite()` adds/removes; SharedPreferences round-trip survives hot restart                     |
| **Search**               | `searchMoviesByQuery()` updates both `searchMoviesProvider` and `searchQueryProvider` atomically       |
| **Legacy removal**       | No `flutter_riverpod/legacy.dart` import anywhere in `lib/` after S5                                   |

### Commands

```bash
# Regenerate all codegen files
dart run build_runner build --delete-conflicting-outputs

# Check for legacy imports
grep -r "flutter_riverpod/legacy" lib/

# Check riverpod_lint diagnostics
dart run riverpod_lint lib/

# Build validation
flutter build ios --no-codesign
```

---

## Next Steps

1. **S1** — Move `riverpod_generator` + `riverpod_lint` to `dev_dependencies`; verify pipeline
2. **S2** — Migrate repository + utility providers; run codegen; confirm identical provider names
3. **S3** — Split and migrate 6 movie/genre notifiers into individual files
4. **S4** — Migrate 4 map-keyed notifiers; add `keepAlive` to favorites
5. **S5** — Migrate legacy `StateNotifier` + `StateProvider` providers; remove all legacy imports
6. **S6** — Update barrel, fix `sharedPreferences` consumer, run linter, validate final build
