# Movie Detail Feature

**File:** `lib/features/movie_detail/presentation/screens/movie_screen.dart`  
**Route:** `/movie/:mid`  
**Route name:** `'movie_screen'`

---

## Overview

Full-detail view for a single movie. Navigated to by pushing `/movie/{id}` from any other screen. On mount it fetches movie info, cast, videos, and similar movies in parallel. While the primary movie object is loading, a centered `CircularProgressIndicator` is shown.

---

## `MovieScreen`

**Type:** `ConsumerStatefulWidget`  
**Constructor:** `required String movieId`

### Initialization (`initState`)

Four providers are loaded on mount, each caching results by `movieId` (no-ops if already cached):

```dart
ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
ref.read(movieVideosProvider.notifier).loadVideos(widget.movieId);
ref.read(similarMoviesProvider.notifier).loadSimilarMovies(widget.movieId);
```

### Watched Provider

```dart
final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
```

Returns `Scaffold > Center > CircularProgressIndicator` while `movie == null`.

---

## Layout

```
Scaffold
└── CustomScrollView (ClampingScrollPhysics)
    ├── _CustomSliverAppBar(movie)
    └── SliverList
        └── _MovieDetails(movie)
```

---

## `_CustomSliverAppBar`

- `backgroundColor: Colors.black`
- `expandedHeight: screenHeight * 0.7`
- `foregroundColor: Colors.white`

**Actions — Favorite Toggle:**

Reads `favoritesMoviesProvider` to determine current state. Tapping calls `favoritesMoviesProvider.notifier.toggleFavorite(movie)`.

| State         | Icon                     |
| ------------- | ------------------------ |
| Not favorited | `Icons.favorite_outline` |
| Favorited     | `Icons.favorite` (red)   |

**`FlexibleSpaceBar` background stack (back to front):**

| Layer                                                      | Description                                            |
| ---------------------------------------------------------- | ------------------------------------------------------ |
| `Image.network(movie.posterPath, fit: BoxFit.cover)`       | Full-bleed poster image                                |
| `DecoratedBox` gradient `topCenter→bottomCenter [0.7–1.0]` | `transparent → black87` fade at bottom                 |
| `_CustomGradient` `[0.8–1.0]` bottom                       | `transparent → black38` extra bottom fade              |
| `_CustomGradient` `[0.0–0.2]` top-left                     | `black87 → transparent` shadow behind back button      |
| `_CustomGradient` `[0.0–0.4]` top-right                    | `black87 → transparent` shadow behind favorites button |

---

## `_MovieDetails`

Renders all detail content as a vertical list of sections:

### 1. Info Row

```
Padding(all: 8) > Row
├── ClipRRect(r=20) > FadeIn > Image.network(posterPath, width: screenWidth * 0.3)
└── Column (width: (screenWidth - 40) * 0.7)
    ├── Text(movie.originalTitle, style: titleLarge)
    ├── Row: Icon(language) + "Original Language: ${originalLanguage.toUpperCase()}"
    │        Icon(group) + "${(popularity / 2).toInt()}"
    └── Text(movie.overview)
```

### 2. Genre Chips

```
Padding(all: 8) > Wrap
└── Chip per genreId
    ├── label: genre name string
    └── backgroundColor: random HSL (hue 220–260, saturation 0.2–1.0, lightness 0.25–0.75)
```

Each chip has `RoundedRectangleBorder(r=20)`. `genreIds` on the `Movie` entity contains genre name strings when loaded from the detail endpoint.

### 3. Cast (`_ActorsByMovie`)

Reads `actorsByMovieProvider[movieId]`.

```
SizedBox(height: 250)
└── ListView.builder(horizontal)
    └── per Actor:
        ├── ClipRRect(r=20) > Image.network(profilePath, 135×180)
        ├── Text(actor.name)
        └── Text(actor.character)   ← nullable
```

Item width: `135`.

### 4. Trailers / Videos (`_TrailersSection`)

Reads `movieVideosProvider[movieId]`.

**Filter logic:**

1. Keep only `isTrailer || isTeaser || isClip`
2. Sort: Trailer → Teaser → Clip, then official-first within each type
3. Take first 3 results

```
SizedBox(height: 175)
└── ListView.builder(horizontal)
    └── _TrailerCard(video) — width: 240
        ├── Image.network(video.youtubeThumbUrl)
        ├── Play button overlay (center)
        ├── Type badge ('TRAILER' / 'TEASER' / 'CLIP') — top-left
        ├── Official verified badge — if video.official
        └── Text(video.name)
```

Tapping a card opens `video.youtubeUrl` in the browser.

### 5. Similar Movies (`_SimilarMoviesSection`)

Reads `similarMoviesProvider[movieId]`. Caps list at 20 items.

```
SizedBox(height: 250)
└── ListView.builder(horizontal)
    └── _SimilarMovieCard(movie) — width: 130
        ├── Image.network(movie.posterPath, 130×185)
        ├── Rating badge (color-coded by voteAverage)
        └── Text(movie.title)
```

Tapping navigates via `context.push('/movie/${movie.id}')`.

### 6. Bottom Padding

`SizedBox(height: 50)`

---

## Navigation

| Action                        | Result                                                        |
| ----------------------------- | ------------------------------------------------------------- |
| Back button (app bar leading) | `go_router` default pop                                       |
| Tap similar movie card        | `context.push('/movie/${movie.id}')` (pushed onto back stack) |
| Tap trailer card              | Opens YouTube URL externally                                  |
