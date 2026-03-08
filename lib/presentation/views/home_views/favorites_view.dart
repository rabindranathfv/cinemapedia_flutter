import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screen/providers/providers.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          ? const Center(child: Text('No favorite movies yet'))
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(movies[index].posterPath),
                trailing: IconButton(
                  onPressed: () {
                    ref
                        .read(favoritesMoviesProvider.notifier)
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
            ),
    );
  }
}
