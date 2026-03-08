import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screen/providers/providers.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  late final Future<List<Movie>> _favoritesMoviesFuture;

  Future<List<Movie>> getFavoritesMovies() async {
    final favorites = ref
        .read(favoritesMoviesProvider.notifier)
        .getFavoriteMovies();
    return favorites;
  }

  @override
  void initState() {
    super.initState();
    _favoritesMoviesFuture = getFavoritesMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
        future: _favoritesMoviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final movies = snapshot.data ?? [];
          if (movies.isEmpty) {
            return const Center(child: Text('No favorite movies yet'));
          }
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => ListTile(
              leading: Image.network(movies[index].posterPath),
              trailing: IconButton(
                onPressed: () async {
                  ref
                      .watch(favoritesMoviesProvider.notifier)
                      .toggleFavorite(movies[index]);
                },
                icon: const Icon(Icons.favorite, color: Colors.red),
              ),
              title: Text(movies[index].title),
              subtitle: Text(movies[index].releaseDate.toString()),
              onTap: () {
                context.go('/movie/${movies[index].id}');
              },
            ),
          );
        },
      ),
    );
  }
}
