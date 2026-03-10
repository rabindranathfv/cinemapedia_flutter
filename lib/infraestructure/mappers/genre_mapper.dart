import 'package:cinemapedia_flutter/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/genre_moviedb.dart';

class GenreMapper {
  static Genre genreDBtoEntity(GenreMovieDB genredb) {
    return Genre(id: genredb.id, name: genredb.name);
  }
}
