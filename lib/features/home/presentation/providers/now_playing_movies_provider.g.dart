// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NowPlayingMovies)
final nowPlayingMoviesProvider = NowPlayingMoviesProvider._();

final class NowPlayingMoviesProvider
    extends $NotifierProvider<NowPlayingMovies, List<Movie>> {
  NowPlayingMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nowPlayingMoviesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nowPlayingMoviesHash();

  @$internal
  @override
  NowPlayingMovies create() => NowPlayingMovies();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Movie> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Movie>>(value),
    );
  }
}

String _$nowPlayingMoviesHash() => r'8bc1d3afa96faf0f436ad30837e89561282550e0';

abstract class _$NowPlayingMovies extends $Notifier<List<Movie>> {
  List<Movie> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Movie>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Movie>, List<Movie>>,
              List<Movie>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
