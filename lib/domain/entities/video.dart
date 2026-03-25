import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
abstract class Video with _$Video {
  const factory Video({
    required String id,
    required String name,
    required String key,
    required String site,
    required String type,
    required bool official,
    required String publishedAt,
  }) = _Video;

  // Required for custom getters
  const Video._();

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  String get youtubeThumbUrl => 'https://img.youtube.com/vi/$key/hqdefault.jpg';

  String get youtubeUrl => 'https://www.youtube.com/watch?v=$key';

  bool get isFromYoutube => site.toLowerCase() == 'youtube';

  bool get isTrailer => type == 'Trailer';
  bool get isTeaser => type == 'Teaser';
  bool get isClip => type == 'Clip';
}
