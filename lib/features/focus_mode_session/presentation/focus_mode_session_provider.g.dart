// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_mode_session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$focusModeSessionNotifierHash() =>
    r'6b3c085a9ff91eb686334fbe1c37e1d17b2d49fc';

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

abstract class _$FocusModeSessionNotifier
    extends BuildlessAutoDisposeNotifier<FocusModeSessionState> {
  late final Pomodoro pomodoro;

  FocusModeSessionState build(
    Pomodoro pomodoro,
  );
}

/// See also [FocusModeSessionNotifier].
@ProviderFor(FocusModeSessionNotifier)
const focusModeSessionNotifierProvider = FocusModeSessionNotifierFamily();

/// See also [FocusModeSessionNotifier].
class FocusModeSessionNotifierFamily extends Family<FocusModeSessionState> {
  /// See also [FocusModeSessionNotifier].
  const FocusModeSessionNotifierFamily();

  /// See also [FocusModeSessionNotifier].
  FocusModeSessionNotifierProvider call(
    Pomodoro pomodoro,
  ) {
    return FocusModeSessionNotifierProvider(
      pomodoro,
    );
  }

  @override
  FocusModeSessionNotifierProvider getProviderOverride(
    covariant FocusModeSessionNotifierProvider provider,
  ) {
    return call(
      provider.pomodoro,
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
  String? get name => r'focusModeSessionNotifierProvider';
}

/// See also [FocusModeSessionNotifier].
class FocusModeSessionNotifierProvider extends AutoDisposeNotifierProviderImpl<
    FocusModeSessionNotifier, FocusModeSessionState> {
  /// See also [FocusModeSessionNotifier].
  FocusModeSessionNotifierProvider(
    Pomodoro pomodoro,
  ) : this._internal(
          () => FocusModeSessionNotifier()..pomodoro = pomodoro,
          from: focusModeSessionNotifierProvider,
          name: r'focusModeSessionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$focusModeSessionNotifierHash,
          dependencies: FocusModeSessionNotifierFamily._dependencies,
          allTransitiveDependencies:
              FocusModeSessionNotifierFamily._allTransitiveDependencies,
          pomodoro: pomodoro,
        );

  FocusModeSessionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pomodoro,
  }) : super.internal();

  final Pomodoro pomodoro;

  @override
  FocusModeSessionState runNotifierBuild(
    covariant FocusModeSessionNotifier notifier,
  ) {
    return notifier.build(
      pomodoro,
    );
  }

  @override
  Override overrideWith(FocusModeSessionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FocusModeSessionNotifierProvider._internal(
        () => create()..pomodoro = pomodoro,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pomodoro: pomodoro,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FocusModeSessionNotifier,
      FocusModeSessionState> createElement() {
    return _FocusModeSessionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FocusModeSessionNotifierProvider &&
        other.pomodoro == pomodoro;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pomodoro.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FocusModeSessionNotifierRef
    on AutoDisposeNotifierProviderRef<FocusModeSessionState> {
  /// The parameter `pomodoro` of this provider.
  Pomodoro get pomodoro;
}

class _FocusModeSessionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<FocusModeSessionNotifier,
        FocusModeSessionState> with FocusModeSessionNotifierRef {
  _FocusModeSessionNotifierProviderElement(super.provider);

  @override
  Pomodoro get pomodoro =>
      (origin as FocusModeSessionNotifierProvider).pomodoro;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
