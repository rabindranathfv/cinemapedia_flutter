import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_moviedb.freezed.dart';
part 'video_moviedb.g.dart';

@freezed
abstract class VideoMovieDB with _$VideoMovieDB {
  const factory VideoMovieDB({
    @Default('') String id,
    @JsonKey(name: 'iso_639_1') @Default('') String iso6391,
    @JsonKey(name: 'iso_3166_1') @Default('') String iso31661,
    @Default('') String key,
    @Default('') String name,
    @Default('') String site,
    @Default(0) int size,
    @Default('') String type,
    @Default(false) bool official,
    @JsonKey(name: 'published_at') @Default('') String publishedAt,
  }) = _VideoMovieDB;

  factory VideoMovieDB.fromJson(Map<String, dynamic> json) =>
      _$VideoMovieDBFromJson(json);
}
