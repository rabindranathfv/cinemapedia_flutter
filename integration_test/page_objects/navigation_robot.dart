import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../keys/application_keys.dart';

final class NavigationRobot {
  NavigationRobot(this.$);

  final PatrolIntegrationTester $;

  Future<void> goToCategories() async {
    await $(find.byKey(K.general.bottomNavCategoriesTab)).tap();
    await $.tester.pumpAndSettle();
  }

  Future<void> goToFavorites() async {
    await $(find.byKey(K.general.bottomNavFavoritesTab)).tap();
    await $.tester.pumpAndSettle();
  }

  Future<void> goToHome() async {
    await $(find.byKey(K.general.bottomNavHomeTab)).tap();
    await $.tester.pumpAndSettle();
  }
}
