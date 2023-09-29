// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_mix_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayMixState {
  Time? get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayMixStateCopyWith<PlayMixState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayMixStateCopyWith<$Res> {
  factory $PlayMixStateCopyWith(
          PlayMixState value, $Res Function(PlayMixState) then) =
      _$PlayMixStateCopyWithImpl<$Res, PlayMixState>;
  @useResult
  $Res call({Time? time});
}

/// @nodoc
class _$PlayMixStateCopyWithImpl<$Res, $Val extends PlayMixState>
    implements $PlayMixStateCopyWith<$Res> {
  _$PlayMixStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayMixStateCopyWith<$Res>
    implements $PlayMixStateCopyWith<$Res> {
  factory _$$_PlayMixStateCopyWith(
          _$_PlayMixState value, $Res Function(_$_PlayMixState) then) =
      __$$_PlayMixStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Time? time});
}

/// @nodoc
class __$$_PlayMixStateCopyWithImpl<$Res>
    extends _$PlayMixStateCopyWithImpl<$Res, _$_PlayMixState>
    implements _$$_PlayMixStateCopyWith<$Res> {
  __$$_PlayMixStateCopyWithImpl(
      _$_PlayMixState _value, $Res Function(_$_PlayMixState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_$_PlayMixState(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time?,
    ));
  }
}

/// @nodoc

class _$_PlayMixState implements _PlayMixState {
  const _$_PlayMixState({this.time});

  @override
  final Time? time;

  @override
  String toString() {
    return 'PlayMixState(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayMixState &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayMixStateCopyWith<_$_PlayMixState> get copyWith =>
      __$$_PlayMixStateCopyWithImpl<_$_PlayMixState>(this, _$identity);
}

abstract class _PlayMixState implements PlayMixState {
  const factory _PlayMixState({final Time? time}) = _$_PlayMixState;

  @override
  Time? get time;
  @override
  @JsonKey(ignore: true)
  _$$_PlayMixStateCopyWith<_$_PlayMixState> get copyWith =>
      throw _privateConstructorUsedError;
}
