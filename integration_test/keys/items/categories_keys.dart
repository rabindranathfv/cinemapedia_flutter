part of '../application_keys.dart';

final class _CategoriesKeys {
  const _CategoriesKeys._();

  Key get view => const Key(PatrolKeys.categoriesView);
  Key get grid => const Key(PatrolKeys.categoriesGrid);
  Key get detailView => const Key(PatrolKeys.categoryDetailView);
  Key get detailMoviesGrid => const Key(PatrolKeys.categoryMoviesGrid);

  Key card(int id) => PatrolKeys.categoryCard(id);
}
