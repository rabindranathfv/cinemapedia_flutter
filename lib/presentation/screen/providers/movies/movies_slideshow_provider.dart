import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlaying = ref.watch(nowPlayingMoviesProvider);
  if (nowPlaying.isEmpty) return [];

  return nowPlaying.sublist(0, 6);
});
