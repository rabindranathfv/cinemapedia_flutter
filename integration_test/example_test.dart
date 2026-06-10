import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patrol/patrol.dart';
import 'package:cinemapedia_flutter/main.dart';
import 'package:cinemapedia_flutter/core/presentation/testing/patrol_keys.dart';
import 'package:cinemapedia_flutter/core/presentation/widgets/background_detector.dart';

void main() {
  patrolTest('tap movie, favorite, return home and search movie', ($) async {
    await dotenv.load(fileName: '.env', mergeWith: {'ENV': 'dev'});

    await $.pumpWidgetAndSettle(
      const ProviderScope(child: BackgroundDetector(child: MainApp())),
    );

    expect($(#home_view).exists, true);
    expect($(#bottom_nav).exists, true);

    // Tap any movie from Home (first keyed movie card).
    final firstMovieCard = find.byWidgetPredicate((widget) {
      final key = widget.key;
      return key is ValueKey<String> &&
          key.value.startsWith(PatrolKeys.homeMovieCardPrefix);
    }).first;

    await $.tester.pumpAndSettle();
    await $.tester.tap(
      find
          .descendant(of: firstMovieCard, matching: find.byType(GestureDetector))
          .first,
    );
    await $.tester.pumpAndSettle();

    expect($(#movie_detail_view).exists, true);

    // Toggle favorite in movie details.
    await $(#movie_detail_favorite_button).tap();
    await $.tester.pumpAndSettle();

    // Return to home.
    await $.tester.tap(find.byTooltip('Back'));
    await $.tester.pumpAndSettle();
    expect($(#home_view).exists, true);

    // Search for any movie and open first result.
    await $(#search_button).tap();
    await $.tester.pumpAndSettle();

    await $.tester.enterText(find.byType(EditableText).first, 'Star Wars');
    await $.tester.pump(const Duration(milliseconds: 700));
    await $.tester.pumpAndSettle();

    await $.tester.tap(find.textContaining('Star').first);
    await $.tester.pumpAndSettle();

    expect($(#movie_detail_view).exists, true);
  });
}
