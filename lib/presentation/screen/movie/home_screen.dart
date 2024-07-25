import 'package:cinemapedia_flutter/config/enviroment/enviroment.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final playingMovies = ref.watch(nowPlayingMoviesProvider);

    // add loading

    return ListView.builder(
      itemCount: playingMovies.length,
      itemBuilder: (context, index) {
        final movie = playingMovies[index];
        return ListTile(
          title: Text(movie.title),
        );
      },
    );
  }
}
