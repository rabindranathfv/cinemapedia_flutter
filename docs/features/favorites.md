# Favorites Feature

**Files:**

- `lib/presentation/views/home_views/favorites_view.dart`
- `lib/presentation/screen/providers/movies/movies_favorites_provider.dart`

**Route:** `/favorites`

---

## Overview

Displays all movies the user has marked as favorite in a staggered masonry grid. Favorites are persisted to `SharedPreferences` and survive app restarts. The feature is also integrated into the movie detail screen via the app bar heart icon.

---

## `FavoritesView`

**Type:** `ConsumerStatefulWidget`

### Initialization (`initState`)

```dart
ref.read(favoritesMoviesProvider.notifier).loadFromPrefs();
```

Loads the persisted favorites map from `SharedPreferences` on mount.

### Build Logic

```dart
ref.watch(favoritesMoviesProvider);  // subscribe for rebuilds
final movies = ref.read(favoritesMoviesProvider.notifier).getFavoriteMovies();
```

### Empty State

Shown when `movies.isEmpty`:

```
Center > Container(border, r=12, padding: h24 v40)
└── Column
    ├── Icon(Icons.movie_creation, size: 80, color: grey)
    ├── Text('Start add some favorites', size: 20, bold)
    └── Text('Select movies you like and they will appear here', grey)
```

### Filled State

```
MovieMasonry(
  movies: movies,
  onMoviesLoaded: () => favoritesMoviesProvider.notifier.loadFromPrefs(),
  toggleFavorite: (movie) => favoritesMoviesProvider.notifier.toggleFavorite(movie),
)
```

### App Bar

- Title: `'Favorites'`
- Leading: `IconButton(Icons.arrow_back)` → `context.go('/')`

---

## `FavoritesMovies` Notifier

**Class:** `FavoritesMovies extends AsyncNotifier<Map<String, Movie>>`  
**Generated provider:** `favoritesMoviesProvider`  
**Annotation:** `@Riverpod(keepAlive: true)`  
**State type:** `Map<String, Movie>` — keyed by `movie.id.toString()`

### `build()` → `{}`

Returns an empty map synchronously. Population happens via `loadFromPrefs()`.

### `loadFromPrefs()`

1. Reads `SharedPreferences.getString('favorites')`
2. JSON-decodes the string into a `List`
3. Maps each entry via `Movie.fromJson(item)`
4. Sets `state = { for each movie: movie.id.toString() → movie }`

### `_saveToPrefs()` (private)

1. `jsonEncode(state.values.map((m) => m.toJson()).toList())`
2. `prefs.setString('favorites', encoded)`

### `toggleFavorite(Movie movie)`

- If `state.containsKey(movie.id.toString())` → removes the entry
- Otherwise → adds `movie.id.toString(): movie`
- Calls `_saveToPrefs()` after every change

### `isFavorite(Movie movie) → bool`

```dart
state.containsKey(movie.id.toString())
```

### `getFavoriteMovies() → List<Movie>`

```dart
state.values.toList()
```

---

## Persistence

| Key           | Type     | Format                                                                     |
| ------------- | -------- | -------------------------------------------------------------------------- |
| `'favorites'` | `String` | JSON-encoded `List<Map<String, dynamic>>` (one `Movie.toJson()` per entry) |

---

## Integration with Movie Detail Screen

The `_CustomSliverAppBar` in `movie_screen.dart` integrates favorites:

```dart
// Read current favorites state
final favoriteProvider = ref.watch(favoritesMoviesProvider);

// Icon toggles on current state
icon: favoriteProvider.containsKey(movie.id.toString())
    ? Icons.favorite          // filled red
    : Icons.favorite_outline  // outline

// On tap
ref.read(favoritesMoviesProvider.notifier).toggleFavorite(movie)
```
