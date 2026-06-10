import 'package:flutter_test/flutter_test.dart';

import '../keys/application_keys.dart';
import '../page_objects/categories_robot.dart';
import '../page_objects/favorites_robot.dart';
import '../page_objects/home_robot.dart';
import '../page_objects/navigation_robot.dart';
import 'base_test_scenario.dart';

final class NavigationSmokeScenario extends BaseTestScenario {
  NavigationSmokeScenario(super.$, {super.next});

  @override
  Future<bool> waitAndCheckValid() async {
    return $(find.byKey(K.home.view)).exists;
  }

  @override
  Future<void> run() async {
    final nav = NavigationRobot($);
    final home = HomeRobot($);
    final categories = CategoriesRobot($);
    final favorites = FavoritesRobot($);

    await home.expectVisible();

    await nav.goToCategories();
    await categories.expectVisible();

    await nav.goToFavorites();
    await favorites.expectVisible();

    await nav.goToHome();
    await home.expectVisible();
  }
}
