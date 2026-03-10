import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_flutter/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_repository_provider.dart';

// Provider that fetches the list of genres
final genresProvider = NotifierProvider<GenresNotifier, List<Genre>>(
  GenresNotifier.new,
);

class GenresNotifier extends Notifier<List<Genre>> {
  @override
  List<Genre> build() {
    return [];
  }

  Future<void> loadGenres() async {
    if (state.isNotEmpty) return; // already loaded
    final genres = await ref.read(movieRepositoryProvider).getGenres();
    state = genres;
  }
}

// Provider that holds movies grouped by genre id
// State: Map<int genreId, List<Movie>>
final moviesByGenreProvider =
    NotifierProvider<MoviesByGenreNotifier, Map<int, List<Movie>>>(
      MoviesByGenreNotifier.new,
    );

class MoviesByGenreNotifier extends Notifier<Map<int, List<Movie>>> {
  final Map<int, int> _currentPage = {};
  final Map<int, bool> _isLoading = {};

  @override
  Map<int, List<Movie>> build() {
    return {};
  }

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
