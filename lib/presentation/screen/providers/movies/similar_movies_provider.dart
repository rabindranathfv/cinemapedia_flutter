import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';

final similarMoviesProvider =
    NotifierProvider<SimilarMoviesNotifier, Map<String, List<Movie>>>(
      SimilarMoviesNotifier.new,
    );

class SimilarMoviesNotifier extends Notifier<Map<String, List<Movie>>> {
  @override
  Map<String, List<Movie>> build() {
    return {};
  }

  Future<void> loadSimilarMovies(String movieId) async {
    if (state[movieId] != null) return;

    final movies = await ref
        .read(movieRepositoryProvider)
        .getSimilarMovies(movieId);

    state = {...state, movieId: movies};
  }
}
