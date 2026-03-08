import 'package:cinemapedia_flutter/presentation/views/home_views/categories_view.dart';
import 'package:cinemapedia_flutter/presentation/views/home_views/favorites_view.dart';
import 'package:cinemapedia_flutter/presentation/views/home_views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia_flutter/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:cinemapedia_flutter/presentation/screen/screens.dart';

GoRouter createAppRouter(ProviderContainer container) {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          // branch 0 - home tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: HomeScreen.name,
                builder: (context, state) => const HomeView(),
                routes: [
                  GoRoute(
                    path: '/movie/:mid',
                    name: MovieScreen.name,
                    builder: (context, state) {
                      return MovieScreen(movieId: state.pathParameters['mid']!);
                    },
                  ),
                ],
              ),
            ],
          ),

          // branch 1 - categories tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/categories',
                builder: (context, state) => const CategoriesView(),
              ),
            ],
          ),

          // branch 2 - Favorites tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoritesView(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final prefs = await container.read(sharedPreferencesProvider.future);
      final isFirstTime = prefs.getBool('isFirstTime') ?? true;
      if (isFirstTime) return '/initial';
      return null;
    },
  );
}



// GoRoute(
//             path: 'movie/:mid',
//             name: MovieScreen.name,
//             builder: (context, state) {
//               return MovieScreen(movieId: state.pathParameters['mid']!);
//             },
//           ),


// GoRoute(
//         path: '/categories',
//         name: CategoriesScreen.name,
//         builder: (context, state) => const CategoriesScreen(),
//       ),
//       GoRoute(
//         path: '/initial',
//         name: InitialScreen.name,
//         builder: (context, state) => const InitialScreen(),
//       ),