import 'package:cinemapedia_flutter/core/domain/entities/actor.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovieId(String movieId);
}
