// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_sound_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnlineSoundBundle {
  SoundType get soundType => throw _privateConstructorUsedError;
  List<SoundOnlineItem> get sounds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlineSoundBundleCopyWith<OnlineSoundBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineSoundBundleCopyWith<$Res> {
  factory $OnlineSoundBundleCopyWith(
          OnlineSoundBundle value, $Res Function(OnlineSoundBundle) then) =
      _$OnlineSoundBundleCopyWithImpl<$Res, OnlineSoundBundle>;
  @useResult
  $Res call({SoundType soundType, List<SoundOnlineItem> sounds});

  $SoundTypeCopyWith<$Res> get soundType;
}

/// @nodoc
class _$OnlineSoundBundleCopyWithImpl<$Res, $Val extends OnlineSoundBundle>
    implements $OnlineSoundBundleCopyWith<$Res> {
  _$OnlineSoundBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundType = null,
    Object? sounds = null,
  }) {
    return _then(_value.copyWith(
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as SoundType,
      sounds: null == sounds
          ? _value.sounds
          : sounds // ignore: cast_nullable_to_non_nullable
              as List<SoundOnlineItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SoundTypeCopyWith<$Res> get soundType {
    return $SoundTypeCopyWith<$Res>(_value.soundType, (value) {
      return _then(_value.copyWith(soundType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OnlineSoundxBundleCopyWith<$Res>
    implements $OnlineSoundBundleCopyWith<$Res> {
  factory _$$_OnlineSoundxBundleCopyWith(_$_OnlineSoundxBundle value,
          $Res Function(_$_OnlineSoundxBundle) then) =
      __$$_OnlineSoundxBundleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SoundType soundType, List<SoundOnlineItem> sounds});

  @override
  $SoundTypeCopyWith<$Res> get soundType;
}

/// @nodoc
class __$$_OnlineSoundxBundleCopyWithImpl<$Res>
    extends _$OnlineSoundBundleCopyWithImpl<$Res, _$_OnlineSoundxBundle>
    implements _$$_OnlineSoundxBundleCopyWith<$Res> {
  __$$_OnlineSoundxBundleCopyWithImpl(
      _$_OnlineSoundxBundle _value, $Res Function(_$_OnlineSoundxBundle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundType = null,
    Object? sounds = null,
  }) {
    return _then(_$_OnlineSoundxBundle(
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as SoundType,
      sounds: null == sounds
          ? _value._sounds
          : sounds // ignore: cast_nullable_to_non_nullable
              as List<SoundOnlineItem>,
    ));
  }
}

/// @nodoc

class _$_OnlineSoundxBundle implements _OnlineSoundxBundle {
  const _$_OnlineSoundxBundle(
      {required this.soundType, required final List<SoundOnlineItem> sounds})
      : _sounds = sounds;

  @override
  final SoundType soundType;
  final List<SoundOnlineItem> _sounds;
  @override
  List<SoundOnlineItem> get sounds {
    if (_sounds is EqualUnmodifiableListView) return _sounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sounds);
  }

  @override
  String toString() {
    return 'OnlineSoundBundle(soundType: $soundType, sounds: $sounds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnlineSoundxBundle &&
            (identical(other.soundType, soundType) ||
                other.soundType == soundType) &&
            const DeepCollectionEquality().equals(other._sounds, _sounds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, soundType, const DeepCollectionEquality().hash(_sounds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnlineSoundxBundleCopyWith<_$_OnlineSoundxBundle> get copyWith =>
      __$$_OnlineSoundxBundleCopyWithImpl<_$_OnlineSoundxBundle>(
          this, _$identity);
}

abstract class _OnlineSoundxBundle implements OnlineSoundBundle {
  const factory _OnlineSoundxBundle(
      {required final SoundType soundType,
      required final List<SoundOnlineItem> sounds}) = _$_OnlineSoundxBundle;

  @override
  SoundType get soundType;
  @override
  List<SoundOnlineItem> get sounds;
  @override
  @JsonKey(ignore: true)
  _$$_OnlineSoundxBundleCopyWith<_$_OnlineSoundxBundle> get copyWith =>
      throw _privateConstructorUsedError;
}
