import 'package:cinemapedia_flutter/core/domain/entities/video.dart';
import 'package:cinemapedia_flutter/core/presentation/providers/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_videos_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieVideos extends _$MovieVideos {
  @override
  Map<String, List<Video>> build() => {};

  Future<void> loadVideos(String movieId) async {
    if (state[movieId] != null) return;

    final videos = await ref
        .read(movieRepositoryProvider)
        .getMovieVideos(movieId);
    state = {...state, movieId: videos};
  }
}
