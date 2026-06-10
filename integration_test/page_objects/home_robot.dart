import 'package:cinemapedia_flutter/core/presentation/testing/patrol_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../keys/application_keys.dart';

final class HomeRobot {
  HomeRobot(this.$);

  final PatrolIntegrationTester $;

  Future<void> expectVisible() async {
    expect($(find.byKey(K.home.view)).exists, true);
  }

  Future<void> openFirstMovie() async {
    final firstMovieCard = find.byWidgetPredicate((widget) {
      final key = widget.key;
      return key is ValueKey<String> &&
          key.value.startsWith(PatrolKeys.homeMovieCardPrefix);
    }).first;

    await $.tester.tap(
      find.descendant(of: firstMovieCard, matching: find.byType(GestureDetector)).first,
    );
    await $.tester.pumpAndSettle();
  }
}
