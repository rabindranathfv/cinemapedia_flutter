import 'package:cinemapedia_flutter/core/presentation/testing/patrol_keys.dart';
import 'package:flutter/material.dart';

part 'items/general_keys.dart';
part 'items/home_keys.dart';
part 'items/movie_detail_keys.dart';
part 'items/search_keys.dart';
part 'items/categories_keys.dart';
part 'items/favorites_keys.dart';

final class ApplicationKeys {
  const ApplicationKeys._();

  static const general = _GeneralKeys._();
  static const home = _HomeKeys._();
  static const movieDetail = _MovieDetailKeys._();
  static const search = _SearchKeys._();
  static const categories = _CategoriesKeys._();
  static const favorites = _FavoritesKeys._();
}

typedef K = ApplicationKeys;
