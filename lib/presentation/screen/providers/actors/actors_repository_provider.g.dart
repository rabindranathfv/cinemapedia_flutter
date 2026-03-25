// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(actorsRepository)
final actorsRepositoryProvider = ActorsRepositoryProvider._();

final class ActorsRepositoryProvider
    extends
        $FunctionalProvider<
          ActorsRepository,
          ActorsRepository,
          ActorsRepository
        >
    with $Provider<ActorsRepository> {
  ActorsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'actorsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$actorsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ActorsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ActorsRepository create(Ref ref) {
    return actorsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ActorsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ActorsRepository>(value),
    );
  }
}

String _$actorsRepositoryHash() => r'1423525b1f15e277b2e9e88c66b35120a995b007';
