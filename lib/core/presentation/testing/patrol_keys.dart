import 'package:flutter/material.dart';

final class PatrolKeys {
  const PatrolKeys._();

  // Home
  static const homeView = 'home_view';
  static const homeSlideshow = 'home_slideshow';
  static const homeNowPlayingList = 'home_now_playing_list';
  static const homeUpcomingList = 'home_upcoming_list';
  static const homePopularList = 'home_popular_list';
  static const homeTopRatedList = 'home_top_rated_list';
  static const homeMovieCardPrefix = 'home_movie_card_';

  // Navigation
  static const bottomNav = 'bottom_nav';
  static const bottomNavHomeTab = 'bottom_nav_home_tab';
  static const bottomNavCategoriesTab = 'bottom_nav_categories_tab';
  static const bottomNavFavoritesTab = 'bottom_nav_favorites_tab';

  // Search
  static const searchButton = 'search_button';
  static const searchNoResults = 'search_no_results';
  static const searchStartState = 'search_start_state';
  static const searchResultTilePrefix = 'search_result_tile_';

  // Movie detail
  static const movieDetailView = 'movie_detail_view';
  static const movieDetailFavoriteButton = 'movie_detail_favorite_button';
  static const movieDetailActorsList = 'movie_detail_actors_list';
  static const movieDetailTrailersList = 'movie_detail_trailers_list';
  static const movieDetailSimilarList = 'movie_detail_similar_list';
  static const movieDetailSimilarCardPrefix = 'movie_detail_similar_card_';

  // Categories
  static const categoriesView = 'categories_view';
  static const categoriesGrid = 'categories_grid';
  static const categoryCardPrefix = 'category_card_';
  static const categoryDetailView = 'category_detail_view';
  static const categoryMoviesGrid = 'category_movies_grid';

  // Favorites
  static const favoritesView = 'favorites_view';
  static const favoritesEmptyState = 'favorites_empty_state';
  static const favoritesGrid = 'favorites_grid';

  // Shared posters
  static const moviePosterPrefix = 'movie_poster_';
  static const favoriteTogglePrefix = 'favorite_toggle_';

  static Key movieCard(int id) => Key('$homeMovieCardPrefix$id');
  static Key searchResultTile(int id) => Key('$searchResultTilePrefix$id');
  static Key categoryCard(int id) => Key('$categoryCardPrefix$id');
  static Key moviePoster(int id) => Key('$moviePosterPrefix$id');
  static Key favoriteToggle(int id) => Key('$favoriteTogglePrefix$id');
  static Key similarMovieCard(int id) => Key('$movieDetailSimilarCardPrefix$id');
}
