import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesMoviesProvider =
    NotifierProvider<MoviesFavoriteNotifier, Map<String, Movie>>(
      MoviesFavoriteNotifier.new,
    );

class MoviesFavoriteNotifier extends Notifier<Map<String, Movie>> {
  MoviesFavoriteNotifier() : super();

  @override
  Map<String, Movie> build() {
    return {};
  }

  void toggleFavorite(Movie movie) {
    final String movieId = movie.id.toString();
    if (state.containsKey(movieId)) {
      print(
        'Removing movie from favorites: ${movie.title} (ID: $movieId)',
      ); // Debug print
      state = {...state}..remove(movieId);
    } else {
      print(
        'adding movie to favorites: ${movie.title} (ID: $movieId)',
      ); // Debug print
      state = {...state, movieId: movie};
    }
  }

  bool isFavorite(Movie movie) {
    final String movieId = movie.id.toString();
    return state.containsKey(movieId);
  }

  List<Movie> getFavoriteMovies() {
    return state.values.toList();
  }
}
