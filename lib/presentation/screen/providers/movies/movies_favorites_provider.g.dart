// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesMovies)
final favoritesMoviesProvider = FavoritesMoviesProvider._();

final class FavoritesMoviesProvider
    extends $NotifierProvider<FavoritesMovies, Map<String, Movie>> {
  FavoritesMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesMoviesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesMoviesHash();

  @$internal
  @override
  FavoritesMovies create() => FavoritesMovies();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, Movie> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, Movie>>(value),
    );
  }
}

String _$favoritesMoviesHash() => r'fb06e4684449d7a5ef5d98d7184823ed09688ef9';

abstract class _$FavoritesMovies extends $Notifier<Map<String, Movie>> {
  Map<String, Movie> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<String, Movie>, Map<String, Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, Movie>, Map<String, Movie>>,
              Map<String, Movie>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
