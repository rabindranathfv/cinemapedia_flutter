// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieVideos)
final movieVideosProvider = MovieVideosProvider._();

final class MovieVideosProvider
    extends $NotifierProvider<MovieVideos, Map<String, List<Video>>> {
  MovieVideosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieVideosProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieVideosHash();

  @$internal
  @override
  MovieVideos create() => MovieVideos();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<Video>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<Video>>>(value),
    );
  }
}

String _$movieVideosHash() => r'b88742253363ec5203dac598f2de834af3b478e4';

abstract class _$MovieVideos extends $Notifier<Map<String, List<Video>>> {
  Map<String, List<Video>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<String, List<Video>>, Map<String, List<Video>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, List<Video>>, Map<String, List<Video>>>,
              Map<String, List<Video>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
