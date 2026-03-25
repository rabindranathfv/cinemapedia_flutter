import 'package:cinemapedia_flutter/domain/entities/actor.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/actors/actors_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_by_movie_provider.g.dart';

@Riverpod(keepAlive: true)
class ActorsByMovie extends _$ActorsByMovie {
  @override
  Map<String, List<Actor>> build() => {};

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await ref
        .read(actorsRepositoryProvider)
        .getActorsByMovieId(movieId);
    state = {...state, movieId: actors};
  }
}
