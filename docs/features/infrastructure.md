# Infrastructure — API, Mappers & Repositories

**Directory:** `lib/infraestructure/`

---

## Overview

Clean Architecture infrastructure layer. Datasources hit the TMDB API via Dio, mappers convert raw models to domain entities, and repository implementations delegate to datasources.

---

## Environment Configuration

**File:** `lib/config/enviroment/enviroment.dart`

```dart
class Enviroment {
  static String theMovieDBKey = dotenv.get('THE_MOVIEDB_KEY', fallback: 'add valid api key');
  static String env           = dotenv.env['ENV'] ?? 'dev';
  static String port          = dotenv.get('PORT', fallback: '5500');
}
```

Loaded in `main()`:

```dart
await dotenv.load(fileName: '.env', mergeWith: {'ENV': 'dev'});
```

The `.env` file at the project root must define `THE_MOVIEDB_KEY`.

---

## `MoviedbDatasource`

**File:** `lib/infraestructure/datasources/moviedb_datasource.dart`  
**Implements:** `MovieDatasource`

### Dio Base Configuration

```dart
BaseOptions(
  baseUrl: 'https://api.themoviedb.org/3',
  queryParameters: {
    'api_key': Enviroment.theMovieDBKey,
    'language': 'en-US',
  },
)
```

### Internal Helper

`_jsonToMovies(Map<String, dynamic> json) → List<Movie>`:

1. Deserializes `MovieDbResponse.fromJson(json)`
2. Filters out entries where mapped `posterPath == 'no-poster'`
3. Maps each via `MovieMapper.movieDBtoEntity(movieMovieDB)`

### Endpoints

| Method                                      | HTTP | Path                      | Extra Params                              | Returns                                         |
| ------------------------------------------- | ---- | ------------------------- | ----------------------------------------- | ----------------------------------------------- |
| `getNowPlaying({int page})`                 | GET  | `/movie/now_playing`      | `page`                                    | `List<Movie>`                                   |
| `getPopular({int page})`                    | GET  | `/movie/popular`          | `page`                                    | `List<Movie>`                                   |
| `getTopRated({int page})`                   | GET  | `/movie/top_rated`        | `page`                                    | `List<Movie>`                                   |
| `getUpcoming({int page})`                   | GET  | `/movie/upcoming`         | `page`                                    | `List<Movie>`                                   |
| `getMovieById(String id)`                   | GET  | `/movie/$id`              | —                                         | `Movie` via `MovieMapper.MovieDetailsToEntity`  |
| `searchMovies(String query)`                | GET  | `/search/movie`           | `query`                                   | `List<Movie>` · returns `[]` if `query.isEmpty` |
| `getGenres()`                               | GET  | `/genre/movie/list`       | —                                         | `List<Genre>` via `GenreMapper.genreDBtoEntity` |
| `getMoviesByGenre(int genreId, {int page})` | GET  | `/discover/movie`         | `with_genres: genreId.toString()`, `page` | `List<Movie>`                                   |
| `getMovieVideos(String movieId)`            | GET  | `/movie/$movieId/videos`  | —                                         | `List<Video>` — **filtered to YouTube-only**    |
| `getSimilarMovies(String movieId)`          | GET  | `/movie/$movieId/similar` | —                                         | `List<Movie>`                                   |

---

## `ActorMoviedbDatasource`

**File:** `lib/infraestructure/datasources/actor_moviedb_datasource.dart`  
**Implements:** `ActorsDatasource`

Uses the same Dio base config as `MoviedbDatasource`.

| Method                               | HTTP | Path                      | Returns                                                                  |
| ------------------------------------ | ---- | ------------------------- | ------------------------------------------------------------------------ |
| `getActorsByMovieId(String movieId)` | GET  | `/movie/$movieId/credits` | `List<Actor>` via `ActorMapper.castToEntity` from `CreditsResponse.cast` |

---

## Mappers

**Directory:** `lib/infraestructure/mappers/`

### `MovieMapper`

**File:** `lib/infraestructure/mappers/movie_mapper.dart`

**`movieDBtoEntity(MovieMovieDB) → Movie`**

- `posterPath`: `'https://image.tmdb.org/t/p/w500${movieMovieDB.posterPath}'` · fallback placeholder URL
- `backdropPath`: `'https://image.tmdb.org/t/p/w500${movieMovieDB.backdropPath}'` · fallback placeholder URL
- `genreIds`: `movieMovieDB.genreIds.map((id) => id.toString()).toList()` (integer IDs as strings)

**`MovieDetailsToEntity(MovieDetails) → Movie`**

- Same URL construction for images
- `genreIds`: `movieDetails.genres.map((g) => g.name).toList()` (genre name strings)

### `ActorMapper`

**File:** `lib/infraestructure/mappers/actor_mapper.dart`

**`castToEntity(Cast) → Actor`**

- `profilePath`: `'https://image.tmdb.org/t/p/w500${cast.profilePath}'` · fallback to Shutterstock silhouette URL when `profilePath` is null

### `GenreMapper`

**File:** `lib/infraestructure/mappers/genre_mapper.dart`

**`genreDBtoEntity(GenreMovieDB) → Genre`**

- Direct passthrough: `Genre(id: genreMovieDB.id, name: genreMovieDB.name)`

### `VideoMapper`

**File:** `lib/infraestructure/mappers/video_mapper.dart`

**`videoDBtoEntity(VideoMovieDB) → Video`**

- Direct field passthrough; no URL construction needed (keys are bare YouTube IDs)

---

## Repository Implementations

### `MovieRepositoryImpl`

**File:** `lib/infraestructure/repositories/movie_repository_impl.dart`  
**Implements:** `MoviesRepository`  
**Constructor:** `{required MovieDatasource datasource}`

All methods delegate directly to `datasource.*`.

### `ActorRepositoryImpl`

**File:** `lib/infraestructure/repositories/actor_repository_impl.dart`  
**Implements:** `ActorsRepository`  
**Constructor:** `{required ActorsDatasource datasource}`

Delegates `getActorsByMovieId(String movieId)` to `datasource`.

---

## Infrastructure Models (Freezed)

**Directory:** `lib/infraestructure/models/moviedb/`

| File                    | Class             | Key Fields                                                                                                                                                                    |
| ----------------------- | ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `moviedb_response.dart` | `MovieDbResponse` | `int page`, `List<MovieMovieDB> results`, `int totalPages`, `int totalResults`, `Dates? dates`                                                                                |
| `movie_moviedb.dart`    | `MovieMovieDB`    | Standard TMDB list fields; uses `_DateTimeSerializer` for `release_date` (handles empty string safely)                                                                        |
| `movie_details.dart`    | `MovieDetails`    | Full TMDB detail response including `List<MovieDetailsGenre> genres`, `runtime`, `budget`, `revenue`, `status`, `tagline`, `imdbId`, `productionCompanies`, `spokenLanguages` |
| `credits_response.dart` | `CreditsResponse` | `int id`, `List<Cast> cast`, `List<Cast> crew`; `Cast` has nullable `profilePath?`, `character?`, `knownForDepartment?`                                                       |
| `genre_moviedb.dart`    | `GenreMovieDB`    | `int id`, `String name`                                                                                                                                                       |
| `video_moviedb.dart`    | `VideoMovieDB`    | `String id`, `String name`, `String key`, `String site`, `String type`, `bool official`, `String publishedAt`                                                                 |

---

## Image Base URLs

| Usage                              | Base URL                                         |
| ---------------------------------- | ------------------------------------------------ |
| Posters, backdrops, profile photos | `https://image.tmdb.org/t/p/w500`                |
| YouTube thumbnails                 | `https://img.youtube.com/vi/{key}/hqdefault.jpg` |
| Actor fallback (no photo)          | Shutterstock silhouette URL                      |
| Movie poster fallback              | TMDB placeholder URL                             |
