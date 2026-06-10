import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../keys/application_keys.dart';

final class SearchRobot {
  SearchRobot(this.$);

  final PatrolIntegrationTester $;

  Future<void> open() async {
    await $(find.byKey(K.search.button)).tap();
    await $.tester.pumpAndSettle();
  }

  Future<void> search(String query) async {
    await $.tester.enterText(find.byType(EditableText).first, query);
    await $.tester.pump(const Duration(milliseconds: 700));
    await $.tester.pumpAndSettle();
  }

  Future<void> selectFirstResultByText(String text) async {
    await $.tester.tap(find.textContaining(text).first);
    await $.tester.pumpAndSettle();
  }
}
