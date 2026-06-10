import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../keys/application_keys.dart';

final class FavoritesRobot {
  FavoritesRobot(this.$);

  final PatrolIntegrationTester $;

  Future<void> expectVisible() async {
    expect($(find.byKey(K.favorites.view)).exists, true);
  }
}
