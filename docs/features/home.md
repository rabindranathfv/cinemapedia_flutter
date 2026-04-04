# Home Feature

**Files:** `lib/features/home/presentation/screens/home_screen.dart`, `lib/features/home/presentation/screens/home_view.dart`

---

## Overview

The home feature is the app entry point (route `/`). It consists of a shell screen that owns the bottom navigation bar and a view that renders the main discovery feed.

---

## `HomeScreen`

**Type:** `StatelessWidget`
**Route name:** `'home_screen'`
**Constructor:** `required StatefulNavigationShell navigationShell`

A pure shell widget. Renders the active tab branch in the body and delegates navigation to `CustomBottomNavigation`. It holds no state and calls no providers.

```
Scaffold
├── body: navigationShell
└── bottomNavigationBar: CustomBottomNavigation(navigationShell)
```

---

## `HomeView`

**Type:** `ConsumerStatefulWidget`

### Initialization (`initState`)

Triggers the first page load for all four movie lists on mount:

```dart
ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
ref.read(popularMoviesProvider.notifier).loadNextPage();
ref.read(topRatedMoviesProvider.notifier).loadNextPage();
ref.read(upcomingMoviesProvider.notifier).loadNextPage();
```

### Watched Providers

| Local variable       | Provider                   | Type                                   |
| -------------------- | -------------------------- | -------------------------------------- |
| `playingMovies`      | `nowPlayingMoviesProvider` | `List<Movie>`                          |
| `playingMoviesSlide` | `moviesSlideshowProvider`  | `List<Movie>` (first 6 of now-playing) |
| `popularMovies`      | `popularMoviesProvider`    | `List<Movie>`                          |
| `topRatedMovies`     | `topRatedMoviesProvider`   | `List<Movie>`                          |
| `upComingMovies`     | `upcomingMoviesProvider`   | `List<Movie>`                          |

### Widget Tree

```
CustomScrollView
├── SliverAppBar (floating: true)
│   └── FlexibleSpaceBar → CustomAppbar()
└── SliverList
    └── Column
        ├── SizedBox(height: 5)
        ├── MoviesSlideshow(movies: playingMoviesSlide)
        ├── MovieHorizontalListView(title: 'In Cinemas',       subtitle: 'Top Movies',      movies: playingMovies,   loadNextPage: ...)
        ├── MovieHorizontalListView(title: 'Comming Soon',     subtitle: 'The next Month',  movies: upComingMovies,  loadNextPage: ...)
        ├── MovieHorizontalListView(title: 'Popular',                                        movies: popularMovies,   loadNextPage: ...)
        ├── MovieHorizontalListView(title: 'Best calification', subtitle: 'from all times', movies: topRatedMovies,  loadNextPage: ...)
        └── SizedBox(height: 40)
```

### Sections

| Section               | Data Source                | Description                                                      |
| --------------------- | -------------------------- | ---------------------------------------------------------------- |
| **App Bar**           | `CustomAppbar`             | Brand logo + search icon                                         |
| **Slideshow**         | First 6 now-playing movies | Auto-playing carousel with swiper pagination dots                |
| **In Cinemas**        | `/movie/now_playing`       | Horizontal paginated list of currently playing movies            |
| **Coming Soon**       | `/movie/upcoming`          | Horizontal paginated list of upcoming movies (next month window) |
| **Popular**           | `/movie/popular`           | Horizontal paginated list of most popular movies                 |
| **Best Calification** | `/movie/top_rated`         | Horizontal paginated list of all-time top-rated movies           |

### Pagination

Pagination is delegated to each `MovieHorizontalListView` instance via the `loadNextPage` callback. The scroll controller inside that widget fires `loadNextPage()` when `scrollPosition + 200 >= maxScrollExtent`.
