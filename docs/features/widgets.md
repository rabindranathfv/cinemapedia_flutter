# Widgets Reference

**Directories:**

- `lib/presentation/widgets/movies/`
- `lib/presentation/widgets/shared/`

---

## Movie Widgets

### `MovieHorizontalListView`

**File:** `lib/presentation/widgets/movies/movie_horizontal_listview.dart`  
**Type:** `StatefulWidget`

**Props:**

| Prop           | Type            | Required | Description                        |
| -------------- | --------------- | -------- | ---------------------------------- |
| `movies`       | `List<Movie>`   | ✓        | Movies to display                  |
| `title`        | `String?`       | —        | Section heading                    |
| `subtitle`     | `String?`       | —        | Subtitle shown as a `FilledButton` |
| `loadNextPage` | `VoidCallback?` | —        | Called to load the next page       |

**Pagination trigger:**

An internal `ScrollController` fires `loadNextPage()` when:

```dart
scrollController.position.pixels + 200 >= maxScrollExtent
```

**Layout:**

```
SizedBox(height: 350)
└── Column
    ├── _Title(title, subtitle)          ← if title != null
    └── Expanded
        └── ListView.builder(horizontal, BouncingScrollPhysics)
            └── FadeInRight > _Slide(movie)
```

**`_Slide` (movie card):**

```
_Slide
├── ClipRRect(r=35) > Image.network(movie.posterPath, width: 150)
├── Text(movie.title, maxLines: 2)
└── Text(HumanFormats.number(movie.voteAverage))
```

Tap: `context.go('/movie/${movie.id}')`

---

### `MoviesSlideshow`

**File:** `lib/presentation/widgets/movies/movies_slideshow.dart`  
**Type:** `StatelessWidget`

**Props:**

| Prop     | Type          | Required | Description                    |
| -------- | ------------- | -------- | ------------------------------ |
| `movies` | `List<Movie>` | ✓        | Movies to show in the carousel |

**Dimensions:** height `210`, width `double.infinity`

**Implementation:** Uses `card_swiper` `Swiper`:

- `viewportFraction: 0.8`
- `scale: 0.9`
- `autoplay: true`
- Pagination: `SwiperPagination` (active: `theme.primary`, inactive: `theme.secondary`)

**`_Slide` (slide card):**

```
DecoratedBox(shadow: black45, blur:10, offset:(0,10))
└── ClipRRect(r=20)
    └── FadeIn > Image.network(movie.backdropPath, fit: BoxFit.cover)
```

---

### `MovieMasonry`

**File:** `lib/presentation/widgets/movies/movie_masonry.dart`  
**Type:** `ConsumerStatefulWidget`

**Props:**

| Prop             | Type                    | Required | Description                                |
| ---------------- | ----------------------- | -------- | ------------------------------------------ |
| `movies`         | `List<Movie>`           | ✓        | Movies to display                          |
| `toggleFavorite` | `Function(Movie)`       | ✓        | Called when the heart icon is tapped       |
| `onMoviesLoaded` | `Function(List<Movie>)` | ✓        | Called in `initState` after movies are set |

**`initState`**: `widget.onMoviesLoaded(widget.movies)`

**Implementation:** `flutter_staggered_grid_view` `MasonryGridView.count`:

- `crossAxisCount: 3`
- `mainAxisSpacing: 8`, `crossAxisSpacing: 8`
- Index `1` gets an extra `SizedBox(height: 20)` offset to create the stagger effect

Each cell: `MoviePosterLink(movie, toggleFavorite)`

---

### `MoviePosterLink`

**File:** `lib/presentation/widgets/movies/movie_poster_link.dart`  
**Type:** `StatelessWidget`

**Props:**

| Prop             | Type                   | Required | Description              |
| ---------------- | ---------------------- | -------- | ------------------------ |
| `movie`          | `Movie`                | ✓        | Movie to display         |
| `toggleFavorite` | `void Function(Movie)` | ✓        | Favorite toggle callback |

**Layout:**

```
GestureDetector(onTap: context.push('/movie/${movie.id}'))
└── Stack
    ├── ClipRRect(r=25) > Image.network(movie.posterPath)
    └── Positioned(top: 8, right: 8)
        └── GestureDetector(onTap: toggleFavorite(movie))
            └── Icon(Icons.favorite, color: Colors.red.shade400, size: 24)
```

---

## Shared Widgets

### `CustomAppbar`

**File:** `lib/presentation/widgets/shared/custom_appbar.dart`  
**Type:** `ConsumerWidget`

**Layout:**

```
Row
├── Icon(Icons.movie_outlined)
├── Text('Cinemapedia')
├── Spacer
└── IconButton(Icons.search) → launches SearchMovieDelegate
```

**Search launch logic:**

```dart
final movie = await showSearch<Movie?>(
  context: context,
  query: ref.read(searchQueryProvider),
  delegate: SearchMovieDelegate(
    initialMovies: ref.read(searchMoviesProvider),
    searchMovies: (query) => ref
        .read(searchMoviesProvider.notifier)
        .searchMoviesByQuery(query),
  ),
);
if (movie != null && context.mounted) context.push('/movie/${movie.id}');
```

---

### `CustomBottomNavigation`

**File:** `lib/presentation/widgets/shared/custom_bottom_navigation.dart`  
**Type:** `StatelessWidget`

**Props:**

| Prop              | Type                      | Required | Description                   |
| ----------------- | ------------------------- | -------- | ----------------------------- |
| `navigationShell` | `StatefulNavigationShell` | ✓        | go_router shell for tab state |

**Implementation:** `BottomNavigationBar(elevation: 0)`

| Index | Label      | Icon                            |
| ----- | ---------- | ------------------------------- |
| 0     | Home       | `Icons.home_max`                |
| 1     | Categories | `Icons.label_important_outline` |
| 2     | Favorite   | `Icons.favorite_outline`        |

```dart
currentIndex: navigationShell.currentIndex
onTap: navigationShell.goBranch(index, initialLocation: index == currentIndex)
```

`initialLocation: true` on same-tab tap navigates back to the tab root.

---

## Helpers

### `HumanFormats.number(double value) → String`

**File:** `lib/config/helpers/human_formats.dart`

Uses `NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: 'en')`.

Examples: `7.5 → '7.5'`, `1200 → '1.2K'`, `1000000 → '1M'`

Used in movie cards to display `voteAverage` and popularity scores.
