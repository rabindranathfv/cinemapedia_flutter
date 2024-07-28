import 'package:flutter/material.dart';

import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';
import 'package:cinemapedia_flutter/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _HomeView(),
      bottomNavigationBar: const CustomBottomNavigation(),
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
    final playingMoviesSlide = ref.watch(moviesSlideshowProvider);

    // add loading

    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideshow(movies: playingMoviesSlide),
        MovieHorizontalListView(
            movies: playingMovies, title: 't1', subtitle: 't2'),
      ],
    );
  }
}
