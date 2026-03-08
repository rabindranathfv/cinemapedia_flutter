import 'package:cinemapedia_flutter/presentation/screen/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:cinemapedia_flutter/presentation/widgets/movies/movie_horizontal_list_view.dart';
import 'package:cinemapedia_flutter/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemapedia_flutter/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia_flutter/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
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
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) {
      return const FullScreenLoader();
    }

    final playingMovies = ref.watch(nowPlayingMoviesProvider);
    final playingMoviesSlide = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);
    final prefs = ref.read(sharedPreferencesProvider.future);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                const SizedBox(height: 5),
                MoviesSlideshow(movies: playingMoviesSlide),
                MovieHorizontalListView(
                  movies: playingMovies,
                  title: 'In Cinemas',
                  subtitle: 'Top Movies',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
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
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.go('/categories');
                  },
                  child: const Text('GO TO CATEGORIES'),
                ),
                const SizedBox(height: 40),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
