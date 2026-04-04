# State Management — Providers

**Framework:** Riverpod codegen (`@riverpod` / `@Riverpod`, `riverpod_annotation`)

---

## Overview

All providers are generated via `riverpod_generator`. The `@Riverpod(keepAlive: true)` annotation prevents auto-disposal; `@riverpod` (lowercase) auto-disposes when no widget is watching.

---

## Infrastructure Providers

### `movieRepositoryProvider`

**File:** `lib/core/presentation/providers/movies_repository_provider.dart`  
**Type:** `@Riverpod(keepAlive: true)` functional  
**Returns:** `MovieRepositoryImpl(datasource: MoviedbDatasource())`

### `actorsRepositoryProvider`

**File:** `lib/core/presentation/providers/actors_repository_provider.dart`  
**Type:** `@Riverpod(keepAlive: true)` functional  
**Returns:** `ActorRepositoryImpl(datasource: ActorMoviedbDatasource())`

### `sharedPreferencesProvider`

**File:** `lib/features/favorites/presentation/providers/shared_preferences_provider.dart`  
**Returns:** `Future<SharedPreferences>` via `SharedPreferences.getInstance()`

---

## Paginated Movie List Providers

All four share an identical pattern: `@Riverpod(keepAlive: true)`, state `List<Movie>`, private `int _currentPage = 0` and `bool _isLoading = false`, a single `loadNextPage()` method.

### Guard pattern in `loadNextPage()`

```dart
if (_isLoading) return;
_isLoading = true;
_currentPage++;
final movies = await ref.read(movieRepositoryProvider).getXxx(page: _currentPage);
state = [...state, ...movies];
await Future.delayed(const Duration(milliseconds: 300));
_isLoading = false;
```

| Provider                   | Class              | Repository method       |
| -------------------------- | ------------------ | ----------------------- |
| `nowPlayingMoviesProvider` | `NowPlayingMovies` | `.getNowPlaying(page:)` |
| `popularMoviesProvider`    | `PopularMovies`    | `.getPopular(page:)`    |
| `topRatedMoviesProvider`   | `TopRatedMovies`   | `.getTopRated(page:)`   |
| `upcomingMoviesProvider`   | `UpcomingMovies`   | `.getUpcoming(page:)`   |

---

## Derived / Computed Providers

### `moviesSlideshowProvider`

**Type:** `@riverpod` functional (auto-dispose)  
**Returns:** `List<Movie>`

```dart
Future<List<Movie>> moviesSlideshow(Ref ref) async {
  final nowPlaying = ref.watch(nowPlayingMoviesProvider);
  return nowPlaying.isEmpty ? [] : nowPlaying.sublist(0, 6);
}
```

Re-evaluates whenever `nowPlayingMoviesProvider` updates.

---

## Movie Detail Cache Providers

All are `@Riverpod(keepAlive: true)` and use a `Map` keyed by movie ID. Every `load*` method no-ops if the key is already present in `state`.

| Provider                | Class           | State type                 | Method                              | Repository call                                   |
| ----------------------- | --------------- | -------------------------- | ----------------------------------- | ------------------------------------------------- |
| `movieInfoProvider`     | `MovieInfo`     | `Map<String, Movie>`       | `loadMovie(String movieId)`         | `movieRepositoryProvider.getMovieById(id)`        |
| `actorsByMovieProvider` | `ActorsByMovie` | `Map<String, List<Actor>>` | `loadActors(String movieId)`        | `actorsRepositoryProvider.getActorsByMovieId(id)` |
| `movieVideosProvider`   | `MovieVideos`   | `Map<String, List<Video>>` | `loadVideos(String movieId)`        | `movieRepositoryProvider.getMovieVideos(id)`      |
| `similarMoviesProvider` | `SimilarMovies` | `Map<String, List<Movie>>` | `loadSimilarMovies(String movieId)` | `movieRepositoryProvider.getSimilarMovies(id)`    |

### Cache guard pattern

```dart
Future<void> loadMovie(String movieId) async {
  if (state[movieId] != null) return;  // already cached
  final movie = await ref.read(movieRepositoryProvider).getMovieById(movieId);
  state = {...state, movieId: movie};
}
```

---

## Categories Providers

### `genresProvider`

**Class:** `Genres`  
**Type:** `@Riverpod(keepAlive: true)`  
**State:** `List<Genre>`

```dart
Future<void> loadGenres() async {
  if (state.isNotEmpty) return;  // no-op if already loaded
  final genres = await ref.read(movieRepositoryProvider).getGenres();
  state = genres;
}
```

### `moviesByGenreProvider`

**Class:** `MoviesByGenre`  
**Type:** `@Riverpod(keepAlive: true)`  
**State:** `Map<int, List<Movie>>`

Maintains per-genre pagination with private `Map<int, int> _currentPages` and `Map<int, bool> _isLoadingMap`.

```dart
Future<void> loadMoviesByGenre(int genreId) async {
  if (_isLoadingMap[genreId] == true) return;
  _isLoadingMap[genreId] = true;
  _currentPages[genreId] = (_currentPages[genreId] ?? 0) + 1;
  final movies = await ref.read(movieRepositoryProvider)
      .getMoviesByGenre(genreId, page: _currentPages[genreId]!);
  state = {
    ...state,
    genreId: [...(state[genreId] ?? []), ...movies],
  };
  await Future.delayed(const Duration(milliseconds: 300));
  _isLoadingMap[genreId] = false;
}
```

---

## Favorites Provider

### `favoritesMoviesProvider`

**Class:** `FavoritesMovies`  
**Type:** `@Riverpod(keepAlive: true)`  
**State:** `Map<String, Movie>` (keyed by `movie.id.toString()`)

See [favorites.md](favorites.md) for full API.

---

## Search Providers

### `searchMoviesProvider`

**Class:** `SearchMovies`  
**Type:** `@Riverpod(keepAlive: true)`  
**State:** `List<Movie>`

```dart
Future<List<Movie>> searchMoviesByQuery(String query) async {
  ref.read(searchQueryProvider.notifier).update(query);
  final movies = await ref.read(movieRepositoryProvider).searchMovies(query);
  state = movies;
  return movies;
}
```

### `searchQueryProvider`

**Class:** `SearchQuery`  
**Type:** `@Riverpod(keepAlive: true)`  
**State:** `String`

```dart
void update(String query) => state = query;
```

---

## Provider Dependency Graph

```
sharedPreferencesProvider
    └── favoritesMoviesProvider

movieRepositoryProvider
    ├── nowPlayingMoviesProvider
    ├── popularMoviesProvider
    ├── topRatedMoviesProvider
    ├── upcomingMoviesProvider
    │   └── moviesSlideshowProvider (derived)
    ├── movieInfoProvider
    ├── movieVideosProvider
    ├── similarMoviesProvider
    ├── genresProvider
    ├── moviesByGenreProvider
    └── searchMoviesProvider
            └── searchQueryProvider

actorsRepositoryProvider
    └── actorsByMovieProvider
```
