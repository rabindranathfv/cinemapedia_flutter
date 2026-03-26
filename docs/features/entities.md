# Domain Entities

**Directory:** `lib/domain/entities/`

All entities use `@freezed` for immutable value objects with generated `copyWith`, `==`, `hashCode`, `fromJson`, and `toJson`.

---

## `Movie`

**File:** `lib/domain/entities/movie.dart`

### Fields

| Field              | Type           | Notes                                                                               |
| ------------------ | -------------- | ----------------------------------------------------------------------------------- |
| `adult`            | `bool`         | Adult content flag                                                                  |
| `backdropPath`     | `String`       | Full TMDB image URL (`/t/p/w500`) or placeholder                                    |
| `genreIds`         | `List<String>` | Genre ID strings (from list endpoints) or genre name strings (from detail endpoint) |
| `id`               | `int`          | TMDB movie ID                                                                       |
| `originalLanguage` | `String`       | ISO 639-1 language code (e.g. `'en'`)                                               |
| `originalTitle`    | `String`       | Title in original language                                                          |
| `overview`         | `String`       | Plot summary                                                                        |
| `popularity`       | `double`       | TMDB popularity score                                                               |
| `posterPath`       | `String`       | Full TMDB image URL (`/t/p/w500`) or placeholder                                    |
| `releaseDate`      | `DateTime`     | Parsed release date                                                                 |
| `title`            | `String`       | Localized title                                                                     |
| `video`            | `bool`         | Whether a video is available                                                        |
| `voteAverage`      | `double`       | Rating 0–10                                                                         |
| `voteCount`        | `int`          | Number of votes                                                                     |

### Factory

```dart
factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
```

Used for deserializing from SharedPreferences (favorites persistence).

---

## `Actor`

**File:** `lib/domain/entities/actor.dart`

### Fields

| Field         | Type      | Notes                                                   |
| ------------- | --------- | ------------------------------------------------------- |
| `id`          | `int`     | TMDB person ID                                          |
| `name`        | `String`  | Full name                                               |
| `profilePath` | `String`  | Full TMDB image URL or Shutterstock silhouette fallback |
| `character`   | `String?` | Character name; nullable                                |

---

## `Genre`

**File:** `lib/domain/entities/genre.dart`

### Fields

| Field  | Type     | Notes              |
| ------ | -------- | ------------------ |
| `id`   | `int`    | TMDB genre ID      |
| `name` | `String` | Genre display name |

### Computed Getters

Requires `const Genre._();` private constructor (Freezed pattern for custom methods).

| Getter           | Return type   | Fallback                                 |
| ---------------- | ------------- | ---------------------------------------- |
| `icon`           | `IconData`    | `Icons.movie`                            |
| `description`    | `String`      | `'Explore $name movies'`                 |
| `gradientColors` | `List<Color>` | `[blueGrey.shade700, blueGrey.shade400]` |

**Mapped TMDB genre IDs:**

| ID    | Genre           |
| ----- | --------------- |
| 28    | Action          |
| 12    | Adventure       |
| 16    | Animation       |
| 35    | Comedy          |
| 80    | Crime           |
| 99    | Documentary     |
| 18    | Drama           |
| 10751 | Family          |
| 14    | Fantasy         |
| 36    | History         |
| 27    | Horror          |
| 10402 | Music           |
| 9648  | Mystery         |
| 10749 | Romance         |
| 878   | Science Fiction |
| 10770 | TV Movie        |
| 53    | Thriller        |
| 10752 | War             |
| 37    | Western         |

---

## `Video`

**File:** `lib/domain/entities/video.dart`

### Fields

| Field         | Type     | Notes                                               |
| ------------- | -------- | --------------------------------------------------- |
| `id`          | `String` | TMDB video ID                                       |
| `name`        | `String` | Display title                                       |
| `key`         | `String` | YouTube video ID                                    |
| `site`        | `String` | Platform name (e.g. `'YouTube'`)                    |
| `type`        | `String` | Video type: `'Trailer'`, `'Teaser'`, `'Clip'`, etc. |
| `official`    | `bool`   | Whether officially published by the studio          |
| `publishedAt` | `String` | ISO 8601 publication date                           |

### Computed Getters

Requires `const Video._();` private constructor.

| Getter            | Return type | Value                                             |
| ----------------- | ----------- | ------------------------------------------------- |
| `youtubeThumbUrl` | `String`    | `'https://img.youtube.com/vi/$key/hqdefault.jpg'` |
| `youtubeUrl`      | `String`    | `'https://www.youtube.com/watch?v=$key'`          |
| `isFromYoutube`   | `bool`      | `site.toLowerCase() == 'youtube'`                 |
| `isTrailer`       | `bool`      | `type == 'Trailer'`                               |
| `isTeaser`        | `bool`      | `type == 'Teaser'`                                |
| `isClip`          | `bool`      | `type == 'Clip'`                                  |
