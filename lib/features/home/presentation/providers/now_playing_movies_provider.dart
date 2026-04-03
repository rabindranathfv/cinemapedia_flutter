import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/core/presentation/providers/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'now_playing_movies_provider.g.dart';

@Riverpod(keepAlive: true)
class NowPlayingMovies extends _$NowPlayingMovies {
  int _currentPage = 0;
  bool _isLoading = false;

  @override
  List<Movie> build() => [];

  Future<void> loadNextPage() async {
    if (_isLoading) return;

    _isLoading = true;
    _currentPage++;
    final movies = await ref
        .read(movieRepositoryProvider)
        .getNowPlaying(page: _currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    _isLoading = false;
  }
}
