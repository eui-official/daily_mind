// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selecting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectingState {
  dynamic get sound => throw _privateConstructorUsedError;
  NetworkType get networkType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectingStateCopyWith<SelectingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectingStateCopyWith<$Res> {
  factory $SelectingStateCopyWith(
          SelectingState value, $Res Function(SelectingState) then) =
      _$SelectingStateCopyWithImpl<$Res, SelectingState>;
  @useResult
  $Res call({dynamic sound, NetworkType networkType});
}

/// @nodoc
class _$SelectingStateCopyWithImpl<$Res, $Val extends SelectingState>
    implements $SelectingStateCopyWith<$Res> {
  _$SelectingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sound = freezed,
    Object? networkType = null,
  }) {
    return _then(_value.copyWith(
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as dynamic,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as NetworkType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectingStateImplCopyWith<$Res>
    implements $SelectingStateCopyWith<$Res> {
  factory _$$SelectingStateImplCopyWith(_$SelectingStateImpl value,
          $Res Function(_$SelectingStateImpl) then) =
      __$$SelectingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic sound, NetworkType networkType});
}

/// @nodoc
class __$$SelectingStateImplCopyWithImpl<$Res>
    extends _$SelectingStateCopyWithImpl<$Res, _$SelectingStateImpl>
    implements _$$SelectingStateImplCopyWith<$Res> {
  __$$SelectingStateImplCopyWithImpl(
      _$SelectingStateImpl _value, $Res Function(_$SelectingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sound = freezed,
    Object? networkType = null,
  }) {
    return _then(_$SelectingStateImpl(
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as dynamic,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as NetworkType,
    ));
  }
}

/// @nodoc

class _$SelectingStateImpl extends _SelectingState {
  const _$SelectingStateImpl({required this.sound, required this.networkType})
      : super._();

  @override
  final dynamic sound;
  @override
  final NetworkType networkType;

  @override
  String toString() {
    return 'SelectingState(sound: $sound, networkType: $networkType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectingStateImpl &&
            const DeepCollectionEquality().equals(other.sound, sound) &&
            (identical(other.networkType, networkType) ||
                other.networkType == networkType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(sound), networkType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectingStateImplCopyWith<_$SelectingStateImpl> get copyWith =>
      __$$SelectingStateImplCopyWithImpl<_$SelectingStateImpl>(
          this, _$identity);
}

abstract class _SelectingState extends SelectingState {
  const factory _SelectingState(
      {required final dynamic sound,
      required final NetworkType networkType}) = _$SelectingStateImpl;
  const _SelectingState._() : super._();

  @override
  dynamic get sound;
  @override
  NetworkType get networkType;
  @override
  @JsonKey(ignore: true)
  _$$SelectingStateImplCopyWith<_$SelectingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
