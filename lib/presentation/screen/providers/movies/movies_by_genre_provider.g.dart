// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_by_genre_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoviesByGenre)
final moviesByGenreProvider = MoviesByGenreProvider._();

final class MoviesByGenreProvider
    extends $NotifierProvider<MoviesByGenre, Map<int, List<Movie>>> {
  MoviesByGenreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesByGenreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesByGenreHash();

  @$internal
  @override
  MoviesByGenre create() => MoviesByGenre();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, List<Movie>>>(value),
    );
  }
}

String _$moviesByGenreHash() => r'2f82b4cd33c3ab2d748eb03d67216df649edffa2';

abstract class _$MoviesByGenre extends $Notifier<Map<int, List<Movie>>> {
  Map<int, List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<int, List<Movie>>, Map<int, List<Movie>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, List<Movie>>, Map<int, List<Movie>>>,
              Map<int, List<Movie>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
