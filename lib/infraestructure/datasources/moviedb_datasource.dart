import 'package:cinemapedia_flutter/config/enviroment/enviroment.dart';
import 'package:cinemapedia_flutter/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_flutter/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/domain/entities/video.dart';
import 'package:cinemapedia_flutter/infraestructure/mappers/genre_mapper.dart';
import 'package:cinemapedia_flutter/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_flutter/infraestructure/mappers/video_mapper.dart';
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/genre_moviedb.dart';
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/movie_details.dart'
    hide Genre;
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/video_moviedb.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'en-US',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final MovieDbResponse movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDBtoEntity(movie))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with Id: $id not found');
    }

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.MovieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response = await dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Genre>> getGenres() async {
    final response = await dio.get('/genre/movie/list');
    final List<dynamic> genres = response.data['genres'] ?? [];
    return genres
        .map((g) => GenreMapper.genreDBtoEntity(GenreMovieDB.fromJson(g)))
        .toList();
  }

  @override
  Future<List<Movie>> getMoviesByGenre(int genreId, {int page = 1}) async {
    final response = await dio.get(
      '/discover/movie',
      queryParameters: {'with_genres': genreId.toString(), 'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Video>> getMovieVideos(String movieId) async {
    final response = await dio.get('/movie/$movieId/videos');
    final List<dynamic> results = response.data['results'] ?? [];
    return results
        .map((v) => VideoMapper.videoDBtoEntity(VideoMovieDB.fromJson(v)))
        .where((video) => video.isFromYoutube)
        .toList();
  }

  @override
  Future<List<Movie>> getSimilarMovies(String movieId) async {
    final response = await dio.get('/movie/$movieId/similar');
    return _jsonToMovies(response.data);
  }
}
