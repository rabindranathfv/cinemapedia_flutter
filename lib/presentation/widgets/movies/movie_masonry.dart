import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/widgets/movies/movie_poster_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MovieMasonry extends ConsumerStatefulWidget {
  final List<Movie> movies;
  final Function(Movie) toggleFavorite;
  final Function(List<Movie>) onMoviesLoaded;

  const MovieMasonry({
    super.key,
    required this.movies,
    required this.toggleFavorite,
    required this.onMoviesLoaded,
  });

  @override
  ConsumerState<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends ConsumerState<MovieMasonry> {
  @override
  void initState() {
    super.initState();
    // Notify parent widget that movies have been loaded
    widget.onMoviesLoaded(widget.movies);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 20),
                MoviePosterLink(
                  movie: widget.movies[index],
                  toggleFavorite: widget.toggleFavorite,
                ),
              ],
            );
          }

          return MoviePosterLink(
            movie: widget.movies[index],
            toggleFavorite: widget.toggleFavorite,
          );
        },
      ),
    );
  }
}
