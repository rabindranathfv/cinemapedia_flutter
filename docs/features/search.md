# Search Feature

**File:** `lib/presentation/delegates/search_movie_delegate.dart`  
**Entry point:** `CustomAppbar` search icon button

---

## Overview

Full-screen search overlay using Flutter's `SearchDelegate`. Supports debounced live search, a persistent last-query/results state across sessions, and direct navigation to a movie detail on selection.

---

## `SearchMovieDelegate`

**Extends:** `SearchDelegate<Movie?>`  
**`searchFieldLabel`:** `'Search movies'`

### Constructor

```dart
SearchMovieDelegate({
  required SearchMoviesCallback searchMovies,
  required List<Movie> initialMovies,
})
```

```dart
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);
```

`initialMovies` seeds the results stream with the previous session's results so the list is not blank on re-open.

### Internal State

| Field             | Type                                        | Purpose                                            |
| ----------------- | ------------------------------------------- | -------------------------------------------------- |
| `searchMovies`    | `SearchMoviesCallback`                      | Injected async search function                     |
| `initialMovies`   | `List<Movie>`                               | Last results; mutated after each successful search |
| `debounceMovies`  | `StreamController<List<Movie>>.broadcast()` | Stream of current movie list                       |
| `isLoadingMovies` | `StreamController<bool>.broadcast()`        | Stream of loading state                            |
| `_debounceTimer`  | `Timer?`                                    | Active debounce timer                              |

---

## Query Flow

### `_onQueryChanged(String query)`

1. Returns immediately if `query.isEmpty`
2. Emits `isLoadingMovies.add(true)`
3. Cancels any active `_debounceTimer`
4. Starts a new `500ms` timer
5. On fire:
   - Calls `searchMovies(query)` (hits `MoviedbDatasource.searchMovies`)
   - Updates `initialMovies` with the result
   - Emits result list to `debounceMovies`
   - Emits `isLoadingMovies.add(false)`

**Debounce duration:** `500ms`

### `clearStreams()`

Called before any navigation away from search:

- Cancels `_debounceTimer`
- Closes `debounceMovies`
- Closes `isLoadingMovies`

---

## UI Zones

### Actions Bar (`buildActions`)

Streams `isLoadingMovies`:

| State                | Widget                                                                         |
| -------------------- | ------------------------------------------------------------------------------ |
| `isLoading == true`  | `SpinPerfect(duration: 1s, infinite, spins: 10) > Icon(Icons.refresh_rounded)` |
| `isLoading == false` | `IconButton(Icons.clear)` → clears `query`                                     |

### Leading (`buildLeading`)

`FadeIn(animate: query.isNotEmpty, duration: 200ms)` wrapping a back `IconButton`:

```dart
clearStreams();
close(context, null);
```

### Results / Suggestions (`buildResults` / `buildSuggestions`)

Both call `_buildResultsAndSuggestions`, which builds a `StreamBuilder` on `debounceMovies` seeded with `initialMovies`:

| State                        | Rendered Widget                                                                                                                 |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `connectionState == waiting` | `Center > CircularProgressIndicator()`                                                                                          |
| `!hasData \|\| data.isEmpty` | `Center > Text('No movies found')`                                                                                              |
| Has results                  | `ListView.builder` with `_MovieSearchItem` per result                                                                           |
| `query.isEmpty` (idle)       | `Center > Container(border, r=12) > Column: Icon(movie_filter_outlined, 80) + 'Start searching' + 'Search for movies by title'` |

### `_MovieSearchItem`

Each result row is a `ListTile`:

- `leading` — `ClipRRect` poster thumbnail (`Image.network(movie.posterPath)`)
- `title` — `movie.title`
- `subtitle` — formatted release date
- `onTap` → `clearStreams(); close(context, movies[index])`

---

## Result Handling (Caller: `CustomAppbar`)

```dart
// Launch search
final movie = await showSearch<Movie?>(
  context: context,
  query: ref.read(searchQueryProvider),        // restores last query
  delegate: SearchMovieDelegate(
    initialMovies: ref.read(searchMoviesProvider),     // restores last results
    searchMovies: (query) => ref
        .read(searchMoviesProvider.notifier)
        .searchMoviesByQuery(query),
  ),
);

// Navigate on selection
if (movie != null && context.mounted) {
  context.push('/movie/${movie.id}');
}
```

---

## Search Providers

### `SearchMovies` — `searchMoviesProvider`

**Type:** `@Riverpod(keepAlive: true)` class-based `Notifier`  
**State:** `List<Movie>`

```dart
Future<List<Movie>> searchMoviesByQuery(String query) async {
  // Also updates searchQueryProvider with the current query
  ref.read(searchQueryProvider.notifier).update(query);
  final movies = await ref.read(movieRepositoryProvider).searchMovies(query);
  state = movies;
  return movies;
}
```

### `SearchQuery` — `searchQueryProvider`

**Type:** `@Riverpod(keepAlive: true)` class-based `Notifier`  
**State:** `String`

```dart
void update(String query) => state = query;
```

Both providers are `keepAlive: true` so the last query and results are preserved when the search overlay is dismissed and re-opened.

---

## TMDB Endpoint

`GET /search/movie?query={query}&api_key=...&language=en-US`  
Returns `[]` immediately if `query.isEmpty` (short-circuit in the datasource).
