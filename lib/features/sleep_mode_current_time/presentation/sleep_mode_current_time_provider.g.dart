// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_mode_current_time_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sleepModeCurrentTimeNotifierHash() =>
    r'a6b49606852dd57c1311e1dfbb184e2ec4f3c7dd';

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

abstract class _$SleepModeCurrentTimeNotifier
    extends BuildlessAutoDisposeNotifier<SleepModeCurrentTimeState> {
  late final DateTime endTime;

  SleepModeCurrentTimeState build(
    DateTime endTime,
  );
}

/// See also [SleepModeCurrentTimeNotifier].
@ProviderFor(SleepModeCurrentTimeNotifier)
const sleepModeCurrentTimeNotifierProvider =
    SleepModeCurrentTimeNotifierFamily();

/// See also [SleepModeCurrentTimeNotifier].
class SleepModeCurrentTimeNotifierFamily
    extends Family<SleepModeCurrentTimeState> {
  /// See also [SleepModeCurrentTimeNotifier].
  const SleepModeCurrentTimeNotifierFamily();

  /// See also [SleepModeCurrentTimeNotifier].
  SleepModeCurrentTimeNotifierProvider call(
    DateTime endTime,
  ) {
    return SleepModeCurrentTimeNotifierProvider(
      endTime,
    );
  }

  @override
  SleepModeCurrentTimeNotifierProvider getProviderOverride(
    covariant SleepModeCurrentTimeNotifierProvider provider,
  ) {
    return call(
      provider.endTime,
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
  String? get name => r'sleepModeCurrentTimeNotifierProvider';
}

/// See also [SleepModeCurrentTimeNotifier].
class SleepModeCurrentTimeNotifierProvider
    extends AutoDisposeNotifierProviderImpl<SleepModeCurrentTimeNotifier,
        SleepModeCurrentTimeState> {
  /// See also [SleepModeCurrentTimeNotifier].
  SleepModeCurrentTimeNotifierProvider(
    DateTime endTime,
  ) : this._internal(
          () => SleepModeCurrentTimeNotifier()..endTime = endTime,
          from: sleepModeCurrentTimeNotifierProvider,
          name: r'sleepModeCurrentTimeNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sleepModeCurrentTimeNotifierHash,
          dependencies: SleepModeCurrentTimeNotifierFamily._dependencies,
          allTransitiveDependencies:
              SleepModeCurrentTimeNotifierFamily._allTransitiveDependencies,
          endTime: endTime,
        );

  SleepModeCurrentTimeNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.endTime,
  }) : super.internal();

  final DateTime endTime;

  @override
  SleepModeCurrentTimeState runNotifierBuild(
    covariant SleepModeCurrentTimeNotifier notifier,
  ) {
    return notifier.build(
      endTime,
    );
  }

  @override
  Override overrideWith(SleepModeCurrentTimeNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SleepModeCurrentTimeNotifierProvider._internal(
        () => create()..endTime = endTime,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        endTime: endTime,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SleepModeCurrentTimeNotifier,
      SleepModeCurrentTimeState> createElement() {
    return _SleepModeCurrentTimeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SleepModeCurrentTimeNotifierProvider &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, endTime.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SleepModeCurrentTimeNotifierRef
    on AutoDisposeNotifierProviderRef<SleepModeCurrentTimeState> {
  /// The parameter `endTime` of this provider.
  DateTime get endTime;
}

class _SleepModeCurrentTimeNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SleepModeCurrentTimeNotifier,
        SleepModeCurrentTimeState> with SleepModeCurrentTimeNotifierRef {
  _SleepModeCurrentTimeNotifierProviderElement(super.provider);

  @override
  DateTime get endTime =>
      (origin as SleepModeCurrentTimeNotifierProvider).endTime;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
