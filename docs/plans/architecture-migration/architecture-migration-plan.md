# Architecture Migration Plan — Layer-First → Feature-First Clean Architecture + Riverpod

> **Created:** 2026-04-03 | **Status:** 🟡 NOT STARTED

## Summary

This plan migrates the project from its current **layer-first** Clean Architecture layout to a **feature-first** Clean Architecture combined with Riverpod Architecture, following the patterns described in [architecture.md](../../architecture/architecture.md).

Currently, the project organizes code by layer at the top level (`domain/`, `infraestructure/`, `presentation/`), with features scattered across all three. This migration restructures the codebase into a `features/` directory (layers inside features) with a `core/` module for truly shared code.

### Current Structure (Layer-First)

```
lib/
├── config/          # Router, theme, env
├── domain/          # ALL entities, ALL repo interfaces
├── infraestructure/ # ALL datasources, ALL mappers, ALL models, ALL repo impls
└── presentation/    # ALL screens, views, widgets, providers
```

### Target Structure (Feature-First)

```
lib/
├── main.dart
├── config/                    # Router, theme, environment
├── core/
│   ├── domain/entities/       # Shared: Movie, Actor, Genre, Video
│   ├── data/
│   │   ├── datasources/       # MovieDB Dio client
│   │   ├── models/moviedb/    # Shared DTOs
│   │   ├── mappers/           # Shared DTO→Entity mappers
│   │   └── repositories/      # Shared repo impls
│   └── presentation/widgets/  # CustomAppbar, CustomBottomNavigation
├── features/
│   ├── home/
│   │   └── presentation/
│   │       ├── screens/       # home_screen.dart
│   │       ├── providers/     # movies_slideshow, now_playing, popular, top_rated, upcoming
│   │       ├── views/         # home_view.dart
│   │       └── widgets/       # movies_slideshow.dart, movie_horizontal_list_view.dart
│   ├── movie_detail/
│   │   └── presentation/
│   │       ├── screens/       # movie_screen.dart
│   │       ├── providers/     # movies_info, movie_videos, similar_movies, actors_by_movie
│   │       └── widgets/       # detail-specific widgets
│   ├── categories/
│   │   └── presentation/
│   │       ├── views/         # categories_view.dart
│   │       ├── providers/     # genres, movies_by_genre
│   │       └── widgets/       # movie_masonry.dart
│   ├── search/
│   │   └── presentation/
│   │       ├── delegates/     # search_movie_delegate.dart
│   │       └── providers/     # search_movies
│   └── favorites/
│       └── presentation/
│           ├── views/         # favorites_view.dart
│           ├── providers/     # movies_favorites, shared_preferences
│           └── widgets/       # favorites-specific widgets
```

---

## Feature Identification

Features are identified by **what the user does**, not by screens:

| Feature          | Description                                     | Key Providers                                                                              |
| ---------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **home**         | Browse trending/popular/upcoming movies         | `nowPlayingMovies`, `popularMovies`, `topRatedMovies`, `upcomingMovies`, `moviesSlideshow` |
| **movie_detail** | View movie info, trailers, similar movies, cast | `moviesInfo`, `movieVideos`, `similarMovies`, `actorsByMovie`                              |
| **categories**   | Browse movies by genre                          | `genres`, `moviesByGenre`                                                                  |
| **search**       | Search movies by query                          | `searchMovies`                                                                             |
| **favorites**    | Save/load favorite movies                       | `moviesFavorites`, `sharedPreferences`                                                     |

### Shared Code (→ `core/`)

| What                                                  | Why shared                                          |
| ----------------------------------------------------- | --------------------------------------------------- |
| `Movie`, `Actor`, `Genre`, `Video` entities           | Used by every feature                               |
| `MoviesRepository`, `ActorsRepository` interfaces     | Used by home, detail, categories, search, favorites |
| `MovieRepositoryImpl`, `ActorRepositoryImpl`          | Single concrete implementations                     |
| `MoviedbDatasource`, `ActorMoviedbDatasource`         | Single API client                                   |
| All DTOs + Mappers                                    | Tied to shared datasource                           |
| `movieRepositoryProvider`, `actorsRepositoryProvider` | Injected into all features                          |
| `CustomAppbar`, `CustomBottomNavigation`              | Used across multiple screens                        |

---

## Implementation Plan

### Vertical Slices

| Slice  | Description                         | Scope                                                     | Risk                              |
| ------ | ----------------------------------- | --------------------------------------------------------- | --------------------------------- |
| **S1** | Create `core/` and move shared code | Domain entities, data layer, shared widgets               | Medium — many import paths change |
| **S2** | Create `features/home/`             | Home screen, home view, 5 movie list providers, slideshow | Medium — most providers live here |
| **S3** | Create `features/movie_detail/`     | Movie screen, detail providers, actor providers           | Low — self-contained              |
| **S4** | Create `features/categories/`       | Categories view, genre providers, masonry widget          | Low — self-contained              |
| **S5** | Create `features/search/`           | Search delegate, search providers                         | Low — self-contained              |
| **S6** | Create `features/favorites/`        | Favorites view, favorites provider, shared prefs          | Low — self-contained              |
| **S7** | Update config & cleanup             | Router, barrel exports, delete empty old folders          | Low                               |

### Slice Dependencies

```
S1 ──→ S2 ──→ S7
 │      │
 ├──→ S3 ──→ S7
 │
 ├──→ S4 ──→ S7
 │
 ├──→ S5 ──→ S7
 │
 └──→ S6 ──→ S7
```

- **S1** must be first — all features depend on `core/`
- **S2–S6** are independent after S1 and can be done in any order
- **S7** consolidates once all features are moved

---

## Suggested Phasing

| Phase | Description                      | Slices | Risk   | Status         |
| ----- | -------------------------------- | ------ | ------ | -------------- |
| **1** | Extract shared code into `core/` | S1     | Medium | 🔲 Not started |
| **2** | Migrate home feature             | S2     | Medium | 🔲 Not started |
| **3** | Migrate movie detail feature     | S3     | Low    | 🔲 Not started |
| **4** | Migrate categories feature       | S4     | Low    | 🔲 Not started |
| **5** | Migrate search feature           | S5     | Low    | 🔲 Not started |
| **6** | Migrate favorites feature        | S6     | Low    | 🔲 Not started |
| **7** | Router update & cleanup          | S7     | Low    | 🔲 Not started |

---

## S1 — Extract Shared Code into `core/`

### Goal

Create the `core/` module containing all code shared across features. After this slice, old layer folders (`domain/`, `infraestructure/`) still exist but `core/` is the new canonical location.

### Tasks

- [ ] Create `lib/core/domain/entities/` and move:
  - `movie.dart` (+`.freezed.dart`, `.g.dart`)
  - `actor.dart` (+`.freezed.dart`, `.g.dart`)
  - `genre.dart` (+`.freezed.dart`, `.g.dart`)
  - `video.dart` (+`.freezed.dart`, `.g.dart`)
- [ ] Create `lib/core/domain/datasources/` and move:
  - `movies_datasource.dart`
  - `actors_datasource.dart`
- [ ] Create `lib/core/domain/repositories/` and move:
  - `movies_repository.dart`
  - `actors_repository.dart`
- [ ] Create `lib/core/data/datasources/` and move:
  - `moviedb_datasource.dart`
  - `actor_moviedb_datasource.dart`
- [ ] Create `lib/core/data/models/moviedb/` and move all DTO files:
  - `moviedb_response.dart`, `movie_moviedb.dart`, `movie_details.dart`
  - `genre_moviedb.dart`, `video_moviedb.dart`, `credits_response.dart`
  - (+ all `.freezed.dart` and `.g.dart` files)
- [ ] Create `lib/core/data/mappers/` and move:
  - `movie_mapper.dart`, `actor_mapper.dart`, `genre_mapper.dart`, `video_mapper.dart`
- [ ] Create `lib/core/data/repositories/` and move:
  - `movie_repository_impl.dart`, `actor_repository_impl.dart`
- [ ] Create `lib/core/presentation/widgets/` and move:
  - `custom_appbar.dart`, `custom_bottom_navigation.dart`
- [ ] Create `lib/core/presentation/providers/` and move repository providers:
  - `movies_repository_provider.dart`, `actors_repository_provider.dart`
- [ ] Update **all** import paths across the project
- [ ] Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] Verify app compiles and runs

### Verification

```bash
flutter analyze   # no errors
flutter run       # app loads correctly
```

---

## S2 — Migrate Home Feature

### Goal

Create `lib/features/home/` containing all home screen presentation code.

### Tasks

- [ ] Create `lib/features/home/presentation/screens/` and move:
  - `home_screen.dart`
- [ ] Create `lib/features/home/presentation/views/` and move:
  - `home_view.dart`
- [ ] Create `lib/features/home/presentation/providers/` and move:
  - `now_playing_movies_provider.dart` (+`.g.dart`)
  - `popular_movies_provider.dart` (+`.g.dart`)
  - `top_rated_movies_provider.dart` (+`.g.dart`)
  - `upcoming_movies_provider.dart` (+`.g.dart`)
  - `movies_slideshow_provider.dart` (+`.g.dart`)
  - `movies_providers.dart` (barrel)
- [ ] Create `lib/features/home/presentation/widgets/` and move:
  - `movies_slideshow.dart`
  - `movie_horizontal_list_view.dart`
  - `movie_poster_link.dart`
- [ ] Update all import paths
- [ ] Run codegen and verify

### Verification

- Home tab loads with carousel + 4 horizontal lists
- Pagination (scroll to load more) still works
- Navigation to movie detail still works

---

## S3 — Migrate Movie Detail Feature

### Goal

Create `lib/features/movie_detail/` containing detail screen and its providers.

### Tasks

- [ ] Create `lib/features/movie_detail/presentation/screens/` and move:
  - `movie_screen.dart`
- [ ] Create `lib/features/movie_detail/presentation/providers/` and move:
  - `movies_info_provider.dart` (+`.g.dart`)
  - `movie_videos_provider.dart` (+`.g.dart`)
  - `similar_movies_provider.dart` (+`.g.dart`)
  - `actors_by_movie_provider.dart` (+`.g.dart`)
- [ ] Create `lib/features/movie_detail/presentation/widgets/` for any detail-specific widgets extracted from `movie_screen.dart`
- [ ] Update all import paths
- [ ] Run codegen and verify

### Verification

- Movie detail screen loads with movie info, cast, videos, similar movies
- Back navigation works
- Deep link via GoRouter `/:id` still resolves

---

## S4 — Migrate Categories Feature

### Goal

Create `lib/features/categories/` containing genre browsing.

### Tasks

- [ ] Create `lib/features/categories/presentation/views/` and move:
  - `categories_view.dart`
- [ ] Create `lib/features/categories/presentation/providers/` and move:
  - `genres_provider.dart` (+`.g.dart`)
  - `movies_by_genre_provider.dart` (+`.g.dart`)
- [ ] Create `lib/features/categories/presentation/widgets/` and move:
  - `movie_masonry.dart`
- [ ] Update all import paths
- [ ] Run codegen and verify

### Verification

- Categories tab shows genre list
- Tapping a genre displays movies in masonry grid
- Scroll pagination within genre works

---

## S5 — Migrate Search Feature

### Goal

Create `lib/features/search/` containing search delegate and providers.

### Tasks

- [ ] Create `lib/features/search/presentation/delegates/` and move:
  - `search_movie_delegate.dart`
- [ ] Create `lib/features/search/presentation/providers/` and move:
  - `search_movies_provider.dart` (+`.g.dart`)
- [ ] Update all import paths
- [ ] Run codegen and verify

### Verification

- Search icon triggers delegate
- Typing a query returns movie results
- Tapping a result navigates to movie detail

---

## S6 — Migrate Favorites Feature

### Goal

Create `lib/features/favorites/` containing favorites management.

### Tasks

- [ ] Create `lib/features/favorites/presentation/views/` and move:
  - `favorites_view.dart`
- [ ] Create `lib/features/favorites/presentation/providers/` and move:
  - `movies_favorites_provider.dart` (+`.g.dart`)
  - `shared_preferences_provider.dart` (+`.g.dart`)
- [ ] Update all import paths
- [ ] Run codegen and verify

### Verification

- Favorites tab shows saved movies
- Toggling a favorite from detail screen reflects here
- Favorites persist after app restart (SharedPreferences)

---

## S7 — Router Update & Final Cleanup

### Goal

Update routing to reference new feature paths. Remove all empty old directories. Clean up barrel exports.

### Tasks

- [ ] Update `lib/config/router/app_router.dart` to import screens/views from `features/`
- [ ] Remove empty old directories:
  - `lib/domain/` (if fully migrated)
  - `lib/infraestructure/` (if fully migrated)
  - `lib/presentation/` (if fully migrated)
- [ ] Create barrel exports per feature:
  - `lib/features/home/home.dart`
  - `lib/features/movie_detail/movie_detail.dart`
  - `lib/features/categories/categories.dart`
  - `lib/features/search/search.dart`
  - `lib/features/favorites/favorites.dart`
  - `lib/core/core.dart`
- [ ] Update `background_detector.dart` location (move to `config/` or `core/`)
- [ ] Run full build:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  flutter analyze
  flutter run
  ```
- [ ] Verify all navigation routes work end-to-end

### Verification

- All 3 tabs load correctly
- Movie detail navigation works from home, categories, search, and favorites
- No analysis warnings about unused imports
- No `domain/`, `infraestructure/`, or `presentation/` folders remain at `lib/` root

---

## Risk Mitigation

| Risk                                             | Impact                   | Mitigation                                                                         |
| ------------------------------------------------ | ------------------------ | ---------------------------------------------------------------------------------- |
| Mass import breakage in S1                       | High — app won't compile | Use IDE refactoring (move file) to auto-update imports; commit after each sub-step |
| Generated `.g.dart` / `.freezed.dart` stale      | Medium — build errors    | Run `build_runner build --delete-conflicting-outputs` after every file move        |
| Circular dependencies between features           | Medium — compile error   | Features never import from other features directly; use `core/` for shared code    |
| GoRouter paths break                             | Low — navigation fails   | Routes are string-based; only import paths change, not route definitions           |
| Provider `keepAlive` state lost during migration | Low — data refetched     | No runtime behavior changes; only file locations move                              |

---

## Post-Migration Checklist

- [ ] No files remain in `lib/domain/`, `lib/infraestructure/`, `lib/presentation/`
- [ ] All providers use `@riverpod` codegen (no manual declarations)
- [ ] `flutter analyze` reports 0 issues
- [ ] App runs end-to-end: home → detail → back, categories, search, favorites
- [ ] `dart run build_runner build` completes without errors
- [ ] All barrel exports are up to date
