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

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppbar(),
          MoviesSlideshow(movies: playingMoviesSlide),
          MovieHorizontalListView(
            movies: playingMovies,
            title: 'In Cinemas',
            subtitle: 'Top Movies',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListView(
            movies: playingMovies,
            title: 'Comming Soon',
            subtitle: 'The next Month',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListView(
            movies: playingMovies,
            title: 'Popular',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
