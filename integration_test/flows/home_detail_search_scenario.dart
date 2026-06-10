import 'package:flutter_test/flutter_test.dart';

import '../keys/application_keys.dart';
import '../page_objects/home_robot.dart';
import '../page_objects/movie_detail_robot.dart';
import '../page_objects/search_robot.dart';
import 'base_test_scenario.dart';

final class HomeDetailSearchScenario extends BaseTestScenario {
  HomeDetailSearchScenario(super.$, {super.next});

  @override
  Future<bool> waitAndCheckValid() async {
    return $(find.byKey(K.home.view)).exists;
  }

  @override
  Future<void> run() async {
    final home = HomeRobot($);
    final detail = MovieDetailRobot($);
    final search = SearchRobot($);

    await home.expectVisible();
    await home.openFirstMovie();

    await detail.expectVisible();
    await detail.toggleFavorite();
    await detail.goBackToHome();

    await home.expectVisible();

    await search.open();
    await search.search('Star Wars');
    await search.selectFirstResultByText('Star');

    await detail.expectVisible();
  }
}
