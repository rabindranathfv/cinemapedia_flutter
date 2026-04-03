import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_moviedb.freezed.dart';
part 'movie_moviedb.g.dart';

@freezed
abstract class MovieMovieDB with _$MovieMovieDB {
  const factory MovieMovieDB({
    @Default(false) bool adult,
    @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
    @JsonKey(name: 'genre_ids') @Default([]) List<int> genreIds,
    required int id,
    @JsonKey(name: 'original_language') @Default('') String originalLanguage,
    @JsonKey(name: 'original_title') @Default('') String originalTitle,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @_DateTimeSerializer()
    @JsonKey(name: 'release_date')
    required DateTime releaseDate,
    @Default('') String title,
    @Default(false) bool video,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
  }) = _MovieMovieDB;

  factory MovieMovieDB.fromJson(Map<String, dynamic> json) =>
      _$MovieMovieDBFromJson(json);
}

class _DateTimeSerializer implements JsonConverter<DateTime, dynamic> {
  const _DateTimeSerializer();

  @override
  DateTime fromJson(dynamic value) =>
      DateTime.tryParse(value?.toString() ?? '') ?? DateTime(0);

  @override
  String toJson(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}
