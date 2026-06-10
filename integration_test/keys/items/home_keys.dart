part of '../application_keys.dart';

final class _HomeKeys {
  const _HomeKeys._();

  Key get view => const Key(PatrolKeys.homeView);
  Key get slideshow => const Key(PatrolKeys.homeSlideshow);
  Key get nowPlayingList => const Key(PatrolKeys.homeNowPlayingList);
  Key get upcomingList => const Key(PatrolKeys.homeUpcomingList);
  Key get popularList => const Key(PatrolKeys.homePopularList);
  Key get topRatedList => const Key(PatrolKeys.homeTopRatedList);

  Key movieCard(int id) => PatrolKeys.movieCard(id);
}
