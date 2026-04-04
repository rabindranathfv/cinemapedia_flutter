import 'package:cinemapedia_flutter/features/categories/presentation/views/categories_view.dart';
import 'package:cinemapedia_flutter/features/favorites/presentation/views/favorites_view.dart';
import 'package:cinemapedia_flutter/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia_flutter/presentation/screen/screens.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GlobalKey<NavigatorState> sectionHomeKey = GlobalKey<NavigatorState>(
  debugLabel: 'sectionHomeNav',
);

final GlobalKey<NavigatorState> sectionCategoriesKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionCategoriesNav');

final GlobalKey<NavigatorState> sectionFavoritesKey = GlobalKey<NavigatorState>(
  debugLabel: 'sectionFavoritesNav',
);

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // branch 0 - home tab
          StatefulShellBranch(
            navigatorKey: sectionHomeKey,
            routes: [
              GoRoute(
                path: '/',
                name: HomeScreen.name,
                builder: (context, state) => const HomeView(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'movie/:mid',
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
            navigatorKey: sectionCategoriesKey,
            routes: [
              GoRoute(
                path: '/categories',
                builder: (context, state) => const CategoriesView(),
              ),
            ],
          ),

          // branch 2 - Favorites tab
          StatefulShellBranch(
            navigatorKey: sectionFavoritesKey,
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
  );
}
