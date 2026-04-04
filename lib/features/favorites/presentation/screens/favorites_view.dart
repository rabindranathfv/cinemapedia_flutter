import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/features/categories/presentation/widgets/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia_flutter/features/favorites/presentation/providers/movies_favorites_provider.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    // Load favorites from SharedPreferences when this view is first created
    ref.read(favoritesMoviesProvider.notifier).loadFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    // ref.watch subscribes to the provider state — rebuilds automatically on change
    ref.watch(favoritesMoviesProvider);
    final movies = ref
        .read(favoritesMoviesProvider.notifier)
        .getFavoriteMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: movies.isEmpty
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.movie_creation, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Start add some favorites',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Select movies you like and they will appear here',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          : MovieMasonry(
              movies: movies,
              onMoviesLoaded: (List<Movie> movies) {
                ref.read(favoritesMoviesProvider.notifier).loadFromPrefs();
              },
              toggleFavorite: (Movie movie) {
                // toggleFavorite now saves to SharedPreferences automatically
                ref
                    .read(favoritesMoviesProvider.notifier)
                    .toggleFavorite(movie);
              },
            ),
    );
  }
}
