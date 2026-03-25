// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Genres)
final genresProvider = GenresProvider._();

final class GenresProvider extends $NotifierProvider<Genres, List<Genre>> {
  GenresProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'genresProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$genresHash();

  @$internal
  @override
  Genres create() => Genres();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Genre> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Genre>>(value),
    );
  }
}

String _$genresHash() => r'46913b295f2a5a302cb90ac01e078bf84f6e6401';

abstract class _$Genres extends $Notifier<List<Genre>> {
  List<Genre> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Genre>, List<Genre>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Genre>, List<Genre>>,
              List<Genre>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
