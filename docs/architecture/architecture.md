# Clean Architecture + Riverpod Architecture

> **Reference:** [Flutter App Architecture with Riverpod](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/) | [Feature-first Project Structure](https://codewithandrea.com/articles/flutter-project-structure/)

## Overview

This project follows **Clean Architecture** principles combined with **Riverpod Architecture** (Andrea Bizzotto's reference architecture). The structure is **feature-first** — each feature owns its own layers, with shared code extracted to a `core/` module.

```
┌─────────────────────────────────────────────────┐
│                PRESENTATION                      │
│  Widgets · Controllers (Notifiers) · Providers   │
├─────────────────────────────────────────────────┤
│                APPLICATION (optional)            │
│  Services — orchestrate multi-repo logic         │
├─────────────────────────────────────────────────┤
│                DOMAIN                            │
│  Entities · Repository interfaces · Value objs   │
├─────────────────────────────────────────────────┤
│                DATA                              │
│  Repositories impl · Datasources · DTOs · Mappers│
└─────────────────────────────────────────────────┘
```

**Dependency rule:** outer layers depend on inner layers, never the reverse. Domain has **zero** dependencies on Flutter, Riverpod, or any external package.

---

## The Four Layers

### 1. Domain Layer (innermost)

The domain layer defines **what** the app does, not **how**.

**Contains:**

- **Entities** — immutable data classes (`@freezed`)
- **Repository interfaces** — abstract contracts for data access
- **Value objects** — typed wrappers for primitive values (optional)

**Rules:**

- No imports from `package:flutter`, `package:dio`, `package:riverpod`, etc.
- Entities are always immutable with value equality
- Repository interfaces define the contract; implementations live in the data layer

```dart
// domain/entities/movie.dart
@freezed
sealed class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    required String posterPath,
    required double voteAverage,
    required DateTime releaseDate,
    @Default([]) List<String> genreIds,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
```

```dart
// domain/repositories/movies_repository.dart
abstract interface class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> searchMovies(String query);
  Future<Movie?> getMovieById(String id);
}
```

### 2. Data Layer

The data layer implements **how** data is fetched, cached, and transformed.

**Contains:**

- **Repository implementations** — concrete classes implementing domain interfaces
- **Datasources** — API clients, local databases, platform APIs
- **DTOs / Models** — raw data structures matching API responses (`@freezed` + `@JsonSerializable`)
- **Mappers** — transform DTOs ↔ domain entities

**Rules:**

- Repositories are the single gateway to external data
- DTOs mirror API shape exactly; entities mirror app needs
- Mappers live here, not in domain

```dart
// data/models/movie_moviedb.dart
@freezed
sealed class MovieMovieDB with _$MovieMovieDB {
  const factory MovieMovieDB({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') @Default(0) double voteAverage,
    @JsonKey(name: 'release_date') @Default('') String releaseDate,
    @JsonKey(name: 'genre_ids') @Default([]) List<int> genreIds,
  }) = _MovieMovieDB;

  factory MovieMovieDB.fromJson(Map<String, dynamic> json) =>
      _$MovieMovieDBFromJson(json);
}
```

```dart
// data/mappers/movie_mapper.dart
class MovieMapper {
  static Movie toEntity(MovieMovieDB dto) => Movie(
        id: dto.id,
        title: dto.title,
        overview: dto.overview,
        posterPath: dto.posterPath != null
            ? 'https://image.tmdb.org/t/p/w500${dto.posterPath}'
            : 'no-poster.jpg',
        voteAverage: dto.voteAverage,
        releaseDate: DateTime.tryParse(dto.releaseDate) ?? DateTime.now(),
        genreIds: dto.genreIds.map((e) => e.toString()).toList(),
      );
}
```

```dart
// data/repositories/movie_repository_impl.dart
class MovieRepositoryImpl implements MoviesRepository {
  final MovieDatasource _datasource;

  MovieRepositoryImpl(this._datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _datasource.getNowPlaying(page: page);
    return response.map(MovieMapper.toEntity).toList();
  }
}
```

### 3. Application Layer (optional)

Use this layer **only** when logic depends on multiple repositories or needs to be shared across multiple controllers.

**Contains:**

- **Services** — orchestrate cross-repository logic

**Rules:**

- Don't create a service if a controller can do it directly
- Services don't manage UI state — that's the controller's job
- If a service only wraps a single repository call, remove it

```dart
// application/services/favorites_sync_service.dart
@riverpod
class FavoritesSyncService extends _$FavoritesSyncService {
  @override
  FutureOr<void> build() {}

  Future<void> toggleFavorite(Movie movie) async {
    final localRepo = ref.read(localStorageRepositoryProvider);
    final analyticsRepo = ref.read(analyticsRepositoryProvider);

    await localRepo.toggleFavorite(movie);
    await analyticsRepo.logFavoriteToggle(movie.id);
  }
}
```

### 4. Presentation Layer (outermost)

The presentation layer displays data and handles user interactions.

**Contains:**

- **Widgets** — stateless/stateful Flutter widgets
- **Controllers** — `@riverpod` notifiers that manage widget state and call repositories/services
- **Providers** — `@riverpod` functions for derived/computed state

**Rules:**

- Widgets use `ref.watch()` to reactively rebuild on state changes
- Controllers use `AsyncNotifier` or `Notifier` (via `@riverpod` codegen)
- Never call a datasource directly from the presentation layer
- Use `ref.read()` only inside callbacks, never inside `build()`

```dart
// presentation/providers/now_playing_movies_provider.dart
@riverpod
class NowPlayingMovies extends _$NowPlayingMovies {
  int _page = 0;

  @override
  List<Movie> build() => [];

  Future<void> loadNextPage() async {
    _page++;
    final repo = ref.read(movieRepositoryProvider);
    final movies = await repo.getNowPlaying(page: _page);
    state = [...state, ...movies];
  }
}
```

```dart
// presentation/widgets/movie_horizontal_list.dart
class MovieHorizontalList extends ConsumerWidget {
  final ProviderListenable<List<Movie>> provider;
  final VoidCallback? loadNextPage;

  const MovieHorizontalList({required this.provider, this.loadNextPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(provider);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) => MoviePosterLink(movie: movies[index]),
    );
  }
}
```

---

## Feature-First Project Structure

### Why Feature-First?

- **Cohesion:** all code for a feature lives together
- **Scalability:** adding a feature = adding a folder, not touching 8 directories
- **Deletability:** removing a feature = deleting one folder
- **Team-friendly:** developers can work on separate features without merge conflicts

### What is a "Feature"?

A feature is **what the user does**, not what the user sees. Think functional requirements, not screens:

| ✅ Good (functional) | ❌ Bad (screen-based) |
| -------------------- | --------------------- |
| `movies`             | `movie_list_page`     |
| `authentication`     | `login_screen`        |
| `favorites`          | `favorites_view`      |
| `search`             | `search_bar_widget`   |

### Target Structure

```
lib/
├── main.dart
├── config/
│   ├── router/
│   │   └── app_router.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── environment/
│       └── environment.dart
├── core/
│   ├── domain/
│   │   └── entities/          # Shared entities (Movie, Actor, Genre, Video)
│   ├── data/
│   │   ├── datasources/       # Shared API clients (Dio instance, MovieDB client)
│   │   ├── models/            # Shared DTOs
│   │   └── mappers/           # Shared DTO→Entity mappers
│   └── presentation/
│       └── widgets/           # Truly shared widgets (AppBar, BottomNav)
├── features/
│   ├── home/
│   │   └── presentation/
│   │       ├── screens/
│   │       ├── providers/
│   │       └── widgets/
│   ├── movie_detail/
│   │   ├── domain/
│   │   │   └── repositories/  # Feature-specific interface (if needed)
│   │   └── presentation/
│   │       ├── screens/
│   │       ├── providers/
│   │       └── widgets/
│   ├── categories/
│   │   └── presentation/
│   │       ├── screens/
│   │       ├── providers/
│   │       └── widgets/
│   ├── search/
│   │   └── presentation/
│   │       ├── providers/
│   │       └── delegates/
│   └── favorites/
│       ├── data/
│       │   └── repositories/  # Local storage for favorites
│       └── presentation/
│           ├── screens/
│           ├── providers/
│           └── widgets/
```

### Rules for Shared vs Feature Code

| Question                | Answer                                                   |
| ----------------------- | -------------------------------------------------------- |
| Used by 1 feature?      | Lives in that feature's folder                           |
| Used by 2+ features?    | Lives in `core/`                                         |
| Not sure yet?           | Start in the feature, move to `core/` when reuse appears |
| Entity used everywhere? | `core/domain/entities/`                                  |

---

## Provider Conventions

### Declaration

All providers use `@riverpod` codegen — no manual `Provider(...)`, `StateProvider(...)`, or `StateNotifierProvider(...)`.

```dart
// ✅ Codegen — always
@riverpod
class PopularMovies extends _$PopularMovies {
  @override
  List<Movie> build() => [];
}

// ✅ Simple derived provider
@riverpod
List<Movie> moviesSlideshow(Ref ref) {
  return ref.watch(nowPlayingMoviesProvider).take(6).toList();
}

// ❌ Manual declaration — never
final popularMoviesProvider = NotifierProvider<PopularMovies, List<Movie>>(
  PopularMovies.new,
);
```

### `keepAlive`

```dart
// Repository providers — always keepAlive (singleton)
@Riverpod(keepAlive: true)
MoviesRepository movieRepository(Ref ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
}

// UI-bound providers — auto-dispose (default)
@riverpod
class NowPlayingMovies extends _$NowPlayingMovies { ... }
```

### `ref.watch` vs `ref.read`

```dart
// ✅ In build() — always watch
final movies = ref.watch(popularMoviesProvider);

// ✅ In callbacks — always read
onPressed: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),

// ❌ Never read in build
final movies = ref.read(popularMoviesProvider); // won't rebuild on changes
```

---

## Data Flow Summary

```
User taps "Load More"
  → Widget calls ref.read(provider.notifier).loadNextPage()
    → Controller reads Repository from provider
      → Repository calls Datasource (HTTP)
        → Datasource returns DTO
      → Mapper transforms DTO → Entity
    → Controller updates state = [...old, ...new]
  → Widget rebuilds via ref.watch()
```

---

## Good Practices

```dart
// ✅ Entities are immutable (freezed)
@freezed sealed class Movie with _$Movie { ... }

// ✅ Repository interfaces in domain, implementations in data
abstract interface class MoviesRepository { ... }

// ✅ Mappers handle all DTO→Entity transformation
MovieMapper.toEntity(movieMovieDB)

// ✅ Providers use codegen
@riverpod class MyNotifier extends _$MyNotifier { ... }

// ✅ Feature folders own their layers
features/favorites/presentation/providers/

// ❌ Don't import infrastructure from presentation directly
import 'package:app/infraestructure/datasources/...'; // wrong

// ❌ Don't put business logic in widgets
onPressed: () async {
  final response = await dio.get('/movies'); // wrong — use a provider
}

// ❌ Don't create application services for single-repo calls
// Just let the controller call the repository directly
```
