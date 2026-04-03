import 'package:cinemapedia_flutter/core/domain/repositories/actors_repository.dart';
import 'package:cinemapedia_flutter/core/data/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia_flutter/core/data/repositories/actor_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ActorsRepository actorsRepository(Ref ref) {
  return ActorRepositoryImpl(datasource: ActorMoviedbDatasource());
}
