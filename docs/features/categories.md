# Categories Feature

**File:** `lib/features/categories/presentation/screens/categories_view.dart`  
**Route:** `/categories`

---

## Overview

Two-level browsing experience. Level 1 shows a grid of all available TMDB genres. Tapping a genre card drills into Level 2, which shows a paginated grid of movies for that genre.

---

## `CategoriesView`

**Type:** `ConsumerStatefulWidget`

### State

```dart
int? _selectedGenreId   // null = show genre grid; non-null = show genre detail
```

### Initialization (`initState`)

```dart
ref.read(genresProvider.notifier).loadGenres();
```

No-ops if genres are already cached.

### Watched Providers

```dart
final genres       = ref.watch(genresProvider);          // List<Genre>
final moviesByGenre = ref.watch(moviesByGenreProvider);  // Map<int, List<Movie>>
```

If `genres.isEmpty` after loading, a centered `CircularProgressIndicator` is displayed.

---

## Level 1 — Genre Grid

Shown when `_selectedGenreId == null`.

```
Scaffold > CustomScrollView
├── SliverAppBar (floating, expandedHeight: 120)
│   └── FlexibleSpaceBar
│       ├── title: 'Categories'
│       └── background: gradient (primary → primary at 60% opacity)
└── SliverPadding(all: 12)
    └── SliverGrid (2 columns, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.4)
        └── _GenreCard per genre
            └── FadeInUp(delay: index * 50ms, duration: 400ms)
```

### `_GenreCard`

**Props:** `Genre genre`, `VoidCallback onTap`  
**Widget:** `Material > InkWell > Container`

Layout layers:

1. **Background** — `genre.gradientColors` linear gradient
2. **Ghost icon** — `genre.icon`, size 70, opacity 0.15 (decorative)
3. **Foreground column** — `genre.icon` (28px) + `Spacer` + `genre.name` (bold 16) + `genre.description` (10px)

**On tap:**

```dart
setState(() => _selectedGenreId = genre.id);
if (moviesByGenre[genre.id] == null) {
  ref.read(moviesByGenreProvider.notifier).loadMoviesByGenre(genre.id);
}
```

---

## Level 2 — Genre Detail

Shown when `_selectedGenreId != null`. The selected `Genre` object is looked up from `genres` by ID.

```
Scaffold > CustomScrollView
├── _GenreDetailHeader          ← SliverAppBar, pinned, expandedHeight: 180
├── _FeaturedMovieSpotlight     ← SliverToBoxAdapter (first movie)
├── _GenreStatsBar              ← SliverToBoxAdapter (computed stats)
├── SliverToBoxAdapter          ← Section title row: genre.icon + 'All ${genre.name} Movies'
└── SliverPadding(horizontal: 12)
    └── SliverGrid (3 columns, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.6)
        └── _MovieGridTile per movie
            └── FadeInUp(delay: (index % 6) * 60ms)
```

### `_GenreDetailHeader`

`SliverAppBar` with genre name, movie count, and `leading` back button that sets `_selectedGenreId = null`.

### `_FeaturedMovieSpotlight`

Displays `movies.first` with a `FadeIn` animation. Tapping navigates `context.push('/movie/${movie.id}')`.

### `_GenreStatsBar`

Computes three stats from the currently loaded movie list:

| Stat            | Computation                                    |
| --------------- | ---------------------------------------------- |
| `avgRating`     | Average `voteAverage` across all loaded movies |
| `avgPopularity` | Average `popularity` across all loaded movies  |
| `highestRated`  | `movie.title` of the highest `voteAverage`     |

Rendered with `FadeInLeft` animation.

### Pagination

In the `SliverGrid.itemBuilder`, when item at index `movies.length - 5` is built:

```dart
if (index == movies.length - 5) {
  ref.read(moviesByGenreProvider.notifier).loadMoviesByGenre(_selectedGenreId!);
}
```

Each genre tracks its own page counter and loading flag inside `MoviesByGenre` notifier.

---

## Genre Entity Computed Properties

Each `Genre` entity provides display metadata via computed getters:

| Getter           | Type          | Details                                                      |
| ---------------- | ------------- | ------------------------------------------------------------ |
| `icon`           | `IconData`    | Per-genre Material icon, fallback `Icons.movie`              |
| `description`    | `String`      | Short description text, fallback `'Explore $name movies'`    |
| `gradientColors` | `List<Color>` | Two-color gradient, fallback `blueGrey.shade700 / .shade400` |

All 19 TMDB genre IDs are covered: 28, 12, 16, 35, 80, 99, 18, 10751, 14, 36, 27, 10402, 9648, 10749, 878, 10770, 53, 10752, 37.
