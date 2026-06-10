import 'config/patrol_test_config.dart';
import 'flows/home_detail_search_scenario.dart';
import 'flows/navigation_smoke_scenario.dart';
import 'page_objects/home_robot.dart';

void main() {
  appTest('home boots with fixtures', ($) async {
    final home = HomeRobot($);
    await home.expectVisible();
  });

  appTest('home-detail-search flow with fixtures', ($) async {
    final scenario = HomeDetailSearchScenario($);
    await scenario.startFlow();
  });

  appTest('navigation smoke: home categories favorites home', ($) async {
    final scenario = NavigationSmokeScenario($);
    await scenario.startFlow();
  });
}
