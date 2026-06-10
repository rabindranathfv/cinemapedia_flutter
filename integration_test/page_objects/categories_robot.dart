import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../keys/application_keys.dart';

final class CategoriesRobot {
  CategoriesRobot(this.$);

  final PatrolIntegrationTester $;

  Future<void> expectVisible() async {
    expect($(find.byKey(K.categories.view)).exists, true);
  }
}
