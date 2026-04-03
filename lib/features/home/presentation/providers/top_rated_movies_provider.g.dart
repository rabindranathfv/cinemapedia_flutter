// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TopRatedMovies)
final topRatedMoviesProvider = TopRatedMoviesProvider._();

final class TopRatedMoviesProvider
    extends $NotifierProvider<TopRatedMovies, List<Movie>> {
  TopRatedMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topRatedMoviesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topRatedMoviesHash();

  @$internal
  @override
  TopRatedMovies create() => TopRatedMovies();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Movie> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Movie>>(value),
    );
  }
}

String _$topRatedMoviesHash() => r'86c39a3cd0b854945b7b1f1ca509322d2504cf83';

abstract class _$TopRatedMovies extends $Notifier<List<Movie>> {
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
