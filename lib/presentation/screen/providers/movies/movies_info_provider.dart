import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_info_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieInfo extends _$MovieInfo {
  @override
  Map<String, Movie> build() => {};

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await ref.read(movieRepositoryProvider).getMovieById(movieId);
    state = {...state, movieId: movie};
  }
}
