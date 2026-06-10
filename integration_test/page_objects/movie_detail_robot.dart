import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../keys/application_keys.dart';

final class MovieDetailRobot {
  MovieDetailRobot(this.$);

  final PatrolIntegrationTester $;

  Future<void> expectVisible() async {
    expect($(find.byKey(K.movieDetail.view)).exists, true);
  }

  Future<void> toggleFavorite() async {
    await $(find.byKey(K.movieDetail.favoriteButton)).tap();
    await $.tester.pumpAndSettle();
  }

  Future<void> goBackToHome() async {
    await $.tester.tap(find.byTooltip('Back'));
    await $.tester.pumpAndSettle();
  }
}
