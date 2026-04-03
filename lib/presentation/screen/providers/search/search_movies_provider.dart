import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/core/presentation/providers/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
}

@Riverpod(keepAlive: true)
class SearchMovies extends _$SearchMovies {
  @override
  List<Movie> build() => [];

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movies = await ref.read(movieRepositoryProvider).searchMovies(query);
    ref.read(searchQueryProvider.notifier).update(query);
    return movies;
  }
}
