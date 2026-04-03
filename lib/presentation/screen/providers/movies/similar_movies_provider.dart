import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/core/presentation/providers/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'similar_movies_provider.g.dart';

@Riverpod(keepAlive: true)
class SimilarMovies extends _$SimilarMovies {
  @override
  Map<String, List<Movie>> build() => {};

  Future<void> loadSimilarMovies(String movieId) async {
    if (state[movieId] != null) return;

    final movies = await ref
        .read(movieRepositoryProvider)
        .getSimilarMovies(movieId);
    state = {...state, movieId: movies};
  }
}
