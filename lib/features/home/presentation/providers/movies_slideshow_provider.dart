import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/features/home/presentation/providers/now_playing_movies_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_slideshow_provider.g.dart';

@riverpod
List<Movie> moviesSlideshow(Ref ref) {
  final nowPlaying = ref.watch(nowPlayingMoviesProvider);
  if (nowPlaying.isEmpty) return [];

  return nowPlaying.sublist(0, 6);
}
