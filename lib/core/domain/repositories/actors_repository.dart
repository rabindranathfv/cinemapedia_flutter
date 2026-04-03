import 'package:cinemapedia_flutter/core/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovieId(String movieId);
}
