import 'dart:convert';

import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'movies_favorites_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoritesMovies extends _$FavoritesMovies {
  @override
  Map<String, Movie> build() => {};

  /// Load favorites from SharedPreferences into state
  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? stored = prefs.getString('favorites');
    if (stored == null || stored.isEmpty) return;

    final List<dynamic> decoded = jsonDecode(stored);
    final Map<String, Movie> loaded = {};
    for (final item in decoded) {
      final movie = Movie.fromJson(item);
      loaded[movie.id.toString()] = movie;
    }
    state = loaded;
  }

  /// Save current state to SharedPreferences
  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(state.values.map((m) => m.toJson()).toList());
    await prefs.setString('favorites', encoded);
  }

  void toggleFavorite(Movie movie) {
    final String movieId = movie.id.toString();
    if (state.containsKey(movieId)) {
      state = {...state}..remove(movieId);
    } else {
      state = {...state, movieId: movie};
    }
    _saveToPrefs();
  }

  bool isFavorite(Movie movie) {
    return state.containsKey(movie.id.toString());
  }

  List<Movie> getFavoriteMovies() {
    return state.values.toList();
  }
}
