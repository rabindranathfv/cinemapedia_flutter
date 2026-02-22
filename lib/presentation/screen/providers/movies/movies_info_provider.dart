import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';

final movieInfoProvider =
    NotifierProvider<MovieMapNotifier, Map<String, Movie>>(
      MovieMapNotifier.new,
    );

class MovieMapNotifier extends Notifier<Map<String, Movie>> {
  @override
  Map<String, Movie> build() {
    return {};
  }

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await ref.read(movieRepositoryProvider).getMovieById(movieId);

    state = {...state, movieId: movie};
  }
}
