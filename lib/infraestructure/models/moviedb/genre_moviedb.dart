import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_moviedb.freezed.dart';
part 'genre_moviedb.g.dart';

@freezed
abstract class GenreMovieDB with _$GenreMovieDB {
  const factory GenreMovieDB({required int id, @Default('') String name}) =
      _GenreMovieDB;

  factory GenreMovieDB.fromJson(Map<String, dynamic> json) =>
      _$GenreMovieDBFromJson(json);
}
