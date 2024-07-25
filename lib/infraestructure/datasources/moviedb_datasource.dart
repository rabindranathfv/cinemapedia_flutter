import 'package:cinemapedia_flutter/config/enviroment/enviroment.dart';
import 'package:cinemapedia_flutter/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MovieDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Enviroment.theMovieDBKey}));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final MovieDbResponse movieDbResponse =
        MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDBtoEntity(movie))
        .toList();

    return movies;
  }
}
