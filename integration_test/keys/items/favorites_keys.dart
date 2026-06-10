part of '../application_keys.dart';

final class _FavoritesKeys {
  const _FavoritesKeys._();

  Key get view => const Key(PatrolKeys.favoritesView);
  Key get emptyState => const Key(PatrolKeys.favoritesEmptyState);
  Key get grid => const Key(PatrolKeys.favoritesGrid);

  Key poster(int id) => PatrolKeys.moviePoster(id);
  Key toggle(int id) => PatrolKeys.favoriteToggle(id);
}
