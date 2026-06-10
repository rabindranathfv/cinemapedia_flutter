import 'config/patrol_test_config.dart';
import 'page_objects/home_robot.dart';
import 'page_objects/movie_detail_robot.dart';
import 'page_objects/search_robot.dart';

void main() {
  appTest('tap movie, favorite, return home and search movie', ($) async {
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
  });
}
