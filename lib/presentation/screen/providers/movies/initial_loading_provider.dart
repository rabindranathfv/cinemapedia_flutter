import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movies_slideshow_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

final initialLoadingProvider = Provider((ref) {
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(moviesSlideshowProvider).isEmpty;
  final step3 = ref.watch(popularMoviesProvider).isEmpty;
  final step4 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step5 = ref.watch(upcomingMoviesProvider).isEmpty;

  if (step1 || step2 || step3 || step4 || step5) return true;

  return false;
});
