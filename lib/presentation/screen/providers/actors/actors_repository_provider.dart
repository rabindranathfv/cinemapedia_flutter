import 'package:cinemapedia_flutter/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia_flutter/infraestructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(datasource: ActorMoviedbDatasource());
});
