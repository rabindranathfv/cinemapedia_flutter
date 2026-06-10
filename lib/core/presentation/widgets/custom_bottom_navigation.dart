import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemapedia_flutter/core/presentation/testing/patrol_keys.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CustomBottomNavigation({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: const Key(PatrolKeys.bottomNav),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max, key: Key(PatrolKeys.bottomNavHomeTab)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.label_important_outline,
            key: Key(PatrolKeys.bottomNavCategoriesTab),
          ),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_outline,
            key: Key(PatrolKeys.bottomNavFavoritesTab),
          ),
          label: 'Favorite',
        ),
      ],
      currentIndex: navigationShell.currentIndex,
      onTap: (index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      ),
    );
  }
}
