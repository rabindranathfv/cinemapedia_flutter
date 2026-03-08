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
          ? const Center(child: Text('No favorite movies yet'))
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(movies[index].posterPath),
                trailing: IconButton(
                  onPressed: () {
                    // toggleFavorite now saves to SharedPreferences automatically
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
