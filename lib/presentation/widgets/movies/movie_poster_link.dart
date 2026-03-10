import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  final void Function(Movie movie) toggleFavorite;

  const MoviePosterLink({
    super.key,
    required this.movie,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/movie/${movie.id}');
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(movie.posterPath),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                // toggleFavorite now saves to SharedPreferences automatically
                toggleFavorite(movie);
              },
              child: Icon(Icons.favorite, color: Colors.red.shade400, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
