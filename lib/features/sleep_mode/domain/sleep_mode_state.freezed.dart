// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_mode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepModeState {
  WakeUpTime? get wakeUpTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepModeStateCopyWith<SleepModeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepModeStateCopyWith<$Res> {
  factory $SleepModeStateCopyWith(
          SleepModeState value, $Res Function(SleepModeState) then) =
      _$SleepModeStateCopyWithImpl<$Res, SleepModeState>;
  @useResult
  $Res call({WakeUpTime? wakeUpTime});
}

/// @nodoc
class _$SleepModeStateCopyWithImpl<$Res, $Val extends SleepModeState>
    implements $SleepModeStateCopyWith<$Res> {
  _$SleepModeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wakeUpTime = freezed,
  }) {
    return _then(_value.copyWith(
      wakeUpTime: freezed == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as WakeUpTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepModeStateImplCopyWith<$Res>
    implements $SleepModeStateCopyWith<$Res> {
  factory _$$SleepModeStateImplCopyWith(_$SleepModeStateImpl value,
          $Res Function(_$SleepModeStateImpl) then) =
      __$$SleepModeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WakeUpTime? wakeUpTime});
}

/// @nodoc
class __$$SleepModeStateImplCopyWithImpl<$Res>
    extends _$SleepModeStateCopyWithImpl<$Res, _$SleepModeStateImpl>
    implements _$$SleepModeStateImplCopyWith<$Res> {
  __$$SleepModeStateImplCopyWithImpl(
      _$SleepModeStateImpl _value, $Res Function(_$SleepModeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wakeUpTime = freezed,
  }) {
    return _then(_$SleepModeStateImpl(
      wakeUpTime: freezed == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as WakeUpTime?,
    ));
  }
}

/// @nodoc

class _$SleepModeStateImpl implements _SleepModeState {
  const _$SleepModeStateImpl({this.wakeUpTime});

  @override
  final WakeUpTime? wakeUpTime;

  @override
  String toString() {
    return 'SleepModeState(wakeUpTime: $wakeUpTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepModeStateImpl &&
            (identical(other.wakeUpTime, wakeUpTime) ||
                other.wakeUpTime == wakeUpTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wakeUpTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepModeStateImplCopyWith<_$SleepModeStateImpl> get copyWith =>
      __$$SleepModeStateImplCopyWithImpl<_$SleepModeStateImpl>(
          this, _$identity);
}

abstract class _SleepModeState implements SleepModeState {
  const factory _SleepModeState({final WakeUpTime? wakeUpTime}) =
      _$SleepModeStateImpl;

  @override
  WakeUpTime? get wakeUpTime;
  @override
  @JsonKey(ignore: true)
  _$$SleepModeStateImplCopyWith<_$SleepModeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
