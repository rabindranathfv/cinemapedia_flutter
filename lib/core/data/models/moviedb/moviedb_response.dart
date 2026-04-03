import 'package:cinemapedia_flutter/core/data/models/moviedb/movie_moviedb.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'moviedb_response.freezed.dart';
part 'moviedb_response.g.dart';

@freezed
abstract class MovieDbResponse with _$MovieDbResponse {
  const factory MovieDbResponse({
    Dates? dates,
    @Default(0) int page,
    @Default([]) List<MovieMovieDB> results,
    @JsonKey(name: 'total_pages') @Default(0) int totalPages,
    @JsonKey(name: 'total_results') @Default(0) int totalResults,
  }) = _MovieDbResponse;

  factory MovieDbResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDbResponseFromJson(json);
}

@freezed
abstract class Dates with _$Dates {
  const factory Dates({required DateTime maximum, required DateTime minimum}) =
      _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}
