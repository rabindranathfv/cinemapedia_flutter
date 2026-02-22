import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_repository_provider.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';

typedef MovieCallback = Future<List<Movie>> Function({int page});

final nowPlayingMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(MoviesNotifier.new);

final popularMoviesProvider =
    NotifierProvider<PopularMoviesNotifier, List<Movie>>(PopularMoviesNotifier.new);

final topRatedMoviesProvider =
    NotifierProvider<TopRatedMoviesNotifier, List<Movie>>(TopRatedMoviesNotifier.new);

final upcomingMoviesProvider =
    NotifierProvider<UpcomingMoviesNotifier, List<Movie>>(UpcomingMoviesNotifier.new);

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    final fetchMoreMovies = ref.read(movieRepositoryProvider).getNowPlaying;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

class PopularMoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    final fetchMoreMovies = ref.read(movieRepositoryProvider).getPopular;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

class TopRatedMoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    final fetchMoreMovies = ref.read(movieRepositoryProvider).getTopRated;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

class UpcomingMoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    final fetchMoreMovies = ref.read(movieRepositoryProvider).getUpcoming;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
