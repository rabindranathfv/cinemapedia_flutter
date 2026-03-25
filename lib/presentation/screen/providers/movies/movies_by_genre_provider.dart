import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_by_genre_provider.g.dart';

@Riverpod(keepAlive: true)
class MoviesByGenre extends _$MoviesByGenre {
  final Map<int, int> _currentPage = {};
  final Map<int, bool> _isLoading = {};

  @override
  Map<int, List<Movie>> build() => {};

  Future<void> loadMoviesByGenre(int genreId) async {
    if (_isLoading[genreId] == true) return;

    _isLoading[genreId] = true;
    _currentPage[genreId] = (_currentPage[genreId] ?? 0) + 1;

    final movies = await ref
        .read(movieRepositoryProvider)
        .getMoviesByGenre(genreId, page: _currentPage[genreId]!);

    final current = state[genreId] ?? [];
    state = {
      ...state,
      genreId: [...current, ...movies],
    };

    await Future.delayed(const Duration(milliseconds: 300));
    _isLoading[genreId] = false;
  }
}
