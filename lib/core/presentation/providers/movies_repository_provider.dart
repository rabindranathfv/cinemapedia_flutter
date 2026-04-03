import 'package:cinemapedia_flutter/core/domain/repositories/movies_repository.dart';
import 'package:cinemapedia_flutter/core/data/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_flutter/core/data/repositories/movie_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_repository_provider.g.dart';

@Riverpod(keepAlive: true)
MoviesRepository movieRepository(Ref ref) {
  return MovieRepositoryImpl(datasource: MoviedbDatasource());
}
