// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_audio_ids_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$baseAudioIdsNotifierHash() =>
    r'6c7317858383c202f942011cf1b1e7f4b248a29c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$BaseAudioIdsNotifier
    extends BuildlessAutoDisposeNotifier<BaseAudioIdsState> {
  late final List<String> ids;

  BaseAudioIdsState build(
    List<String> ids,
  );
}

/// See also [BaseAudioIdsNotifier].
@ProviderFor(BaseAudioIdsNotifier)
const baseAudioIdsNotifierProvider = BaseAudioIdsNotifierFamily();

/// See also [BaseAudioIdsNotifier].
class BaseAudioIdsNotifierFamily extends Family<BaseAudioIdsState> {
  /// See also [BaseAudioIdsNotifier].
  const BaseAudioIdsNotifierFamily();

  /// See also [BaseAudioIdsNotifier].
  BaseAudioIdsNotifierProvider call(
    List<String> ids,
  ) {
    return BaseAudioIdsNotifierProvider(
      ids,
    );
  }

  @override
  BaseAudioIdsNotifierProvider getProviderOverride(
    covariant BaseAudioIdsNotifierProvider provider,
  ) {
    return call(
      provider.ids,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'baseAudioIdsNotifierProvider';
}

/// See also [BaseAudioIdsNotifier].
class BaseAudioIdsNotifierProvider extends AutoDisposeNotifierProviderImpl<
    BaseAudioIdsNotifier, BaseAudioIdsState> {
  /// See also [BaseAudioIdsNotifier].
  BaseAudioIdsNotifierProvider(
    List<String> ids,
  ) : this._internal(
          () => BaseAudioIdsNotifier()..ids = ids,
          from: baseAudioIdsNotifierProvider,
          name: r'baseAudioIdsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$baseAudioIdsNotifierHash,
          dependencies: BaseAudioIdsNotifierFamily._dependencies,
          allTransitiveDependencies:
              BaseAudioIdsNotifierFamily._allTransitiveDependencies,
          ids: ids,
        );

  BaseAudioIdsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
  }) : super.internal();

  final List<String> ids;

  @override
  BaseAudioIdsState runNotifierBuild(
    covariant BaseAudioIdsNotifier notifier,
  ) {
    return notifier.build(
      ids,
    );
  }

  @override
  Override overrideWith(BaseAudioIdsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: BaseAudioIdsNotifierProvider._internal(
        () => create()..ids = ids,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BaseAudioIdsNotifier, BaseAudioIdsState>
      createElement() {
    return _BaseAudioIdsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BaseAudioIdsNotifierProvider && other.ids == ids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BaseAudioIdsNotifierRef
    on AutoDisposeNotifierProviderRef<BaseAudioIdsState> {
  /// The parameter `ids` of this provider.
  List<String> get ids;
}

class _BaseAudioIdsNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<BaseAudioIdsNotifier,
        BaseAudioIdsState> with BaseAudioIdsNotifierRef {
  _BaseAudioIdsNotifierProviderElement(super.provider);

  @override
  List<String> get ids => (origin as BaseAudioIdsNotifierProvider).ids;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
