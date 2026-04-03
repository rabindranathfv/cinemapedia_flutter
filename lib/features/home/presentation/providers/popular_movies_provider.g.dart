// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PopularMovies)
final popularMoviesProvider = PopularMoviesProvider._();

final class PopularMoviesProvider
    extends $NotifierProvider<PopularMovies, List<Movie>> {
  PopularMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularMoviesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularMoviesHash();

  @$internal
  @override
  PopularMovies create() => PopularMovies();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Movie> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Movie>>(value),
    );
  }
}

String _$popularMoviesHash() => r'092add696ec4571edaaf23ca1c6315e565941f59';

abstract class _$PopularMovies extends $Notifier<List<Movie>> {
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
