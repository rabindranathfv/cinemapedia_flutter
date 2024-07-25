import 'package:cinemapedia_flutter/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  MovieRepositoryImpl({required this.datasource});

  final MovieDatasource datasource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return datasource.getNowPlaying(page: page);
  }
}