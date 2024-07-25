import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_flutter/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_flutter/infraestructure/repositories/movie_repository_impl.dart';

// inmutable repository
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource: MoviedbDatasource());
});
