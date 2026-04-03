import 'package:cinemapedia_flutter/core/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_flutter/core/domain/entities/actor.dart';
import 'package:cinemapedia_flutter/core/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  ActorRepositoryImpl({required this.datasource});

  final ActorsDatasource datasource;

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return datasource.getActorsByMovieId(movieId);
  }
}
