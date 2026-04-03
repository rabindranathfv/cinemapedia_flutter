import 'package:cinemapedia_flutter/core/domain/entities/video.dart';
import 'package:cinemapedia_flutter/core/data/models/moviedb/video_moviedb.dart';

class VideoMapper {
  static Video videoDBtoEntity(VideoMovieDB videoDB) => Video(
    id: videoDB.id,
    name: videoDB.name,
    key: videoDB.key,
    site: videoDB.site,
    type: videoDB.type,
    official: videoDB.official,
    publishedAt: videoDB.publishedAt,
  );
}
