import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_flutter/config/helpers/human_formats.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
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
          return const Center(child: Text('No movies found'));
        }

        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => ListTile(
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
            return IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh, color: Colors.blue.shade300),
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

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.movie_outlined, size: 40),
                ),
              ),
            ),
            const SizedBox(width: 10),

            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  Text(
                    movie.releaseDate.year.toString(),
                    style: textStyles.titleSmall,
                  ),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage),
                        style: textStyles.bodyMedium!.copyWith(
                          color: Colors.yellow.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
