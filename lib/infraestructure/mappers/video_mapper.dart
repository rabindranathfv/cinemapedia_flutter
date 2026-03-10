import 'package:cinemapedia_flutter/domain/entities/video.dart';
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/video_moviedb.dart';

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
