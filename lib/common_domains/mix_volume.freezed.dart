// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mix_volume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MixVolume {
  String get id => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MixVolumeCopyWith<MixVolume> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixVolumeCopyWith<$Res> {
  factory $MixVolumeCopyWith(MixVolume value, $Res Function(MixVolume) then) =
      _$MixVolumeCopyWithImpl<$Res, MixVolume>;
  @useResult
  $Res call({String id, double volume});
}

/// @nodoc
class _$MixVolumeCopyWithImpl<$Res, $Val extends MixVolume>
    implements $MixVolumeCopyWith<$Res> {
  _$MixVolumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MixVolumeImplCopyWith<$Res>
    implements $MixVolumeCopyWith<$Res> {
  factory _$$MixVolumeImplCopyWith(
          _$MixVolumeImpl value, $Res Function(_$MixVolumeImpl) then) =
      __$$MixVolumeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double volume});
}

/// @nodoc
class __$$MixVolumeImplCopyWithImpl<$Res>
    extends _$MixVolumeCopyWithImpl<$Res, _$MixVolumeImpl>
    implements _$$MixVolumeImplCopyWith<$Res> {
  __$$MixVolumeImplCopyWithImpl(
      _$MixVolumeImpl _value, $Res Function(_$MixVolumeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
  }) {
    return _then(_$MixVolumeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MixVolumeImpl implements _MixVolume {
  const _$MixVolumeImpl({required this.id, required this.volume});

  @override
  final String id;
  @override
  final double volume;

  @override
  String toString() {
    return 'MixVolume(id: $id, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MixVolumeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MixVolumeImplCopyWith<_$MixVolumeImpl> get copyWith =>
      __$$MixVolumeImplCopyWithImpl<_$MixVolumeImpl>(this, _$identity);
}

abstract class _MixVolume implements MixVolume {
  const factory _MixVolume(
      {required final String id,
      required final double volume}) = _$MixVolumeImpl;

  @override
  String get id;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$MixVolumeImplCopyWith<_$MixVolumeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
