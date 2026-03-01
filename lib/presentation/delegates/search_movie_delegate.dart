import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  @override
  String? get searchFieldLabel => 'Search Movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return FadeIn(
      animate: query.isNotEmpty,
      duration: const Duration(milliseconds: 300),
      child: IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
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

    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search_off, size: 80, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'No movies found',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Try searching with:\n• Movie titles\n• Actor names\n• Release year',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, height: 1.5),
                  ),
                ],
              ),
            ),
          );
        }

        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              leading:
                  movie.posterPath.isNotEmpty && movie.posterPath != 'no-poster'
                  ? Image.network(movie.posterPath, width: 50)
                  : const Icon(Icons.movie, size: 40),
              title: Text(movie.title),
              subtitle: Text(movie.releaseDate.year.toString()),
              onTap: () {
                close(context, movie);
              },
            );
          },
          itemCount: movies.length,
        );
      },
    );
  }
}
