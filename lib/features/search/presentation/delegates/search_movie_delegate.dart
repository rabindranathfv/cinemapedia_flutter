import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/core/presentation/testing/patrol_keys.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  StreamController<bool> isLoadingMovies = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({required this.searchMovies, required this.initialMovies})
    : super(searchFieldLabel: 'Search movies') {
    debounceMovies.add(initialMovies);
  }

  void clearStreams() {
    _debounceTimer?.cancel();
    debounceMovies.close();
    isLoadingMovies.close();
  }

  void _onQueryChanged(String query) {
    if (query.isEmpty) return;
    isLoadingMovies.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await searchMovies(query);
      initialMovies = movies;
      debounceMovies.add(movies);
      isLoadingMovies.add(false);
    });
  }

  StreamBuilder<List<Movie>> _buildResultsAndSuggestions(
    Stream<List<Movie>> moviesStream,
    List<Movie> initialMovies,
  ) {
    return StreamBuilder(
      initialData: initialMovies,
      stream: moviesStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            key: Key(PatrolKeys.searchNoResults),
            child: Text('No movies found'),
          );
        }

        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => ListTile(
            key: PatrolKeys.searchResultTile(movies[index].id),
            leading: Image.network(movies[index].posterPath),
            title: Text(movies[index].title),
            subtitle: Text(movies[index].releaseDate.toString()),
            onTap: () {
              clearStreams();
              close(context, movies[index]);
            },
          ),
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingMovies.stream,
        builder: (context, snapshot) {
          final isLoading = snapshot.data ?? false;
          if (isLoading) {
            return SpinPerfect(
              duration: const Duration(seconds: 1),
              infinite: true,
              spins: 10,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.refresh_rounded),
              ),
            );
          }
          return IconButton(
            onPressed: () => query = '',
            icon: const Icon(Icons.clear),
          );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return FadeIn(
      animate: query.isNotEmpty,
      duration: const Duration(milliseconds: 200),
      child: IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultsAndSuggestions(debounceMovies.stream, initialMovies);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    if (query.isEmpty) {
      return Center(
        key: const Key(PatrolKeys.searchStartState),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.movie_filter_outlined, size: 80, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'Start searching',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Search for movies by title',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return _buildResultsAndSuggestions(debounceMovies.stream, initialMovies);
  }
}
