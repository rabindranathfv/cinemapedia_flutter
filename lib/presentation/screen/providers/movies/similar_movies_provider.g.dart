// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SimilarMovies)
final similarMoviesProvider = SimilarMoviesProvider._();

final class SimilarMoviesProvider
    extends $NotifierProvider<SimilarMovies, Map<String, List<Movie>>> {
  SimilarMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'similarMoviesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$similarMoviesHash();

  @$internal
  @override
  SimilarMovies create() => SimilarMovies();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<Movie>>>(value),
    );
  }
}

String _$similarMoviesHash() => r'18405f03a94ae23dcce197631c37ef7802970cf7';

abstract class _$SimilarMovies extends $Notifier<Map<String, List<Movie>>> {
  Map<String, List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<String, List<Movie>>, Map<String, List<Movie>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, List<Movie>>, Map<String, List<Movie>>>,
              Map<String, List<Movie>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
