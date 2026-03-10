import 'package:cinemapedia_flutter/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/domain/entities/video.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<Movie> getMovieById(String id);
  Future<List<Movie>> searchMovies(String query);
  Future<List<Genre>> getGenres();
  Future<List<Movie>> getMoviesByGenre(int genreId, {int page = 1});
  Future<List<Video>> getMovieVideos(String movieId);
  Future<List<Movie>> getSimilarMovies(String movieId);
}
