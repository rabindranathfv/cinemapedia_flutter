import 'package:cinemapedia_flutter/core/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/core/data/models/moviedb/genre_moviedb.dart';

class GenreMapper {
  static Genre genreDBtoEntity(GenreMovieDB genredb) {
    return Genre(id: genredb.id, name: genredb.name);
  }
}
