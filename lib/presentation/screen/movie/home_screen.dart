import 'package:cinemapedia_flutter/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';
import 'package:cinemapedia_flutter/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    print('Rederizo HOME!!!!');
    final playingMovies = ref.watch(nowPlayingMoviesProvider);
    final playingMoviesSlide = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);
    final prefs = ref.read(sharedPreferencesProvider.future);

    // add loading

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  prefs.then((prefs) {
                    prefs.setBool('isFirstTime', true);
                  });
                },
                child: const Text('MARKS HOME'),
              ),
              MoviesSlideshow(movies: playingMoviesSlide),
              MovieHorizontalListView(
                movies: playingMovies,
                title: 'In Cinemas',
                subtitle: 'Top Movies',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListView(
                movies: upComingMovies,
                title: 'Comming Soon',
                subtitle: 'The next Month',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListView(
                movies: popularMovies,
                title: 'Popular',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListView(
                movies: topRatedMovies,
                title: 'Best calification',
                subtitle: 'from all times',
                loadNextPage: () =>
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/categories');
                },
                child: const Text('GO TO CATEGORIES'),
              ),
              const SizedBox(height: 40),
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}
