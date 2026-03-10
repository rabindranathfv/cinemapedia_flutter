import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_flutter/domain/entities/video.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';

final movieVideosProvider =
    NotifierProvider<MovieVideosNotifier, Map<String, List<Video>>>(
      MovieVideosNotifier.new,
    );

class MovieVideosNotifier extends Notifier<Map<String, List<Video>>> {
  @override
  Map<String, List<Video>> build() {
    return {};
  }

  Future<void> loadVideos(String movieId) async {
    if (state[movieId] != null) return;

    final videos = await ref
        .read(movieRepositoryProvider)
        .getMovieVideos(movieId);

    state = {...state, movieId: videos};
  }
}
