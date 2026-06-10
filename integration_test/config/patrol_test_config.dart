import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:patrol/patrol.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_repositories.dart';
import 'test_app.dart';

typedef AppTestCallback = Future<void> Function(PatrolIntegrationTester $);

Future<void> resetFavoritesStorage() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

void appTest(
  String description,
  AppTestCallback callback, {
  List overrides = const [],
}) {
  patrolTest(description, ($) async {
    await dotenv.load(fileName: '.env', mergeWith: {'ENV': 'dev'});
    await resetFavoritesStorage();

    final mergedOverrides = [...testRepositoryOverrides(), ...overrides];
    await $.pumpWidgetAndSettle(buildTestApp(overrides: mergedOverrides));

    await callback($);
  });
}
