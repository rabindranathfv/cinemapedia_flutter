part of '../application_keys.dart';

final class _SearchKeys {
  const _SearchKeys._();

  Key get button => const Key(PatrolKeys.searchButton);
  Key get startState => const Key(PatrolKeys.searchStartState);
  Key get noResults => const Key(PatrolKeys.searchNoResults);

  Key resultTile(int id) => PatrolKeys.searchResultTile(id);
}
