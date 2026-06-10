part of '../application_keys.dart';

final class _MovieDetailKeys {
  const _MovieDetailKeys._();

  Key get view => const Key(PatrolKeys.movieDetailView);
  Key get favoriteButton => const Key(PatrolKeys.movieDetailFavoriteButton);
  Key get actorsList => const Key(PatrolKeys.movieDetailActorsList);
  Key get trailersList => const Key(PatrolKeys.movieDetailTrailersList);
  Key get similarList => const Key(PatrolKeys.movieDetailSimilarList);

  Key similarMovieCard(int id) => PatrolKeys.similarMovieCard(id);
}
