import 'package:cinemapedia_flutter/presentation/screen/movie/movie_screen.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_flutter/presentation/screen/screens.dart';
import 'package:go_router/go_router.dart';

GoRouter createAppRouter(ProviderContainer container) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/movie/:mid',
        name: MovieScreen.name,
        builder: (context, state) {
          print(
              'STATE: ${state.name} ${state.pageKey} ${state.path} ${state.pathParameters}');

          return MovieScreen(
            movieId: state.pathParameters['mid']!,
          );
        },
      ),
      GoRoute(
        path: '/categories',
        name: CategoriesScreen.name,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: '/initial',
        name: InitialScreen.name,
        builder: (context, state) => const InitialScreen(),
      ),
    ],
    redirect: (context, state) async {
      // Access shared preferences through the provider
      final prefs = await container.read(sharedPreferencesProvider.future);
      final isFirstTime = prefs.getBool('isFirstTime') ?? true;
      print('ISFIRSTTIME: ${isFirstTime}');

      // Logic for redirecting based on first time
      if (isFirstTime) {
        print('ES 1RA VEZ QUE ENTRA A LA APP');
        // prefs.setsBool('isFirstTime', false);
        return '/initial';
      }
      return null; // No redirection, continue as normal
    },
  );
}
