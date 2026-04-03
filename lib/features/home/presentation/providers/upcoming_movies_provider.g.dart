// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpcomingMovies)
final upcomingMoviesProvider = UpcomingMoviesProvider._();

final class UpcomingMoviesProvider
    extends $NotifierProvider<UpcomingMovies, List<Movie>> {
  UpcomingMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upcomingMoviesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upcomingMoviesHash();

  @$internal
  @override
  UpcomingMovies create() => UpcomingMovies();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Movie> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Movie>>(value),
    );
  }
}

String _$upcomingMoviesHash() => r'00fc8748df636e6ec31f3b80b63a8eb344a65b71';

abstract class _$UpcomingMovies extends $Notifier<List<Movie>> {
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
