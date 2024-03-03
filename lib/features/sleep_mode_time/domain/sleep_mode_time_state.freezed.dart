// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_mode_time_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SleepModeTimeState {
  DateTime get currentTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepModeTimeStateCopyWith<SleepModeTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepModeTimeStateCopyWith<$Res> {
  factory $SleepModeTimeStateCopyWith(
          SleepModeTimeState value, $Res Function(SleepModeTimeState) then) =
      _$SleepModeTimeStateCopyWithImpl<$Res, SleepModeTimeState>;
  @useResult
  $Res call({DateTime currentTime, DateTime endTime});
}

/// @nodoc
class _$SleepModeTimeStateCopyWithImpl<$Res, $Val extends SleepModeTimeState>
    implements $SleepModeTimeStateCopyWith<$Res> {
  _$SleepModeTimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepModeTimeStateImplCopyWith<$Res>
    implements $SleepModeTimeStateCopyWith<$Res> {
  factory _$$SleepModeTimeStateImplCopyWith(_$SleepModeTimeStateImpl value,
          $Res Function(_$SleepModeTimeStateImpl) then) =
      __$$SleepModeTimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime currentTime, DateTime endTime});
}

/// @nodoc
class __$$SleepModeTimeStateImplCopyWithImpl<$Res>
    extends _$SleepModeTimeStateCopyWithImpl<$Res, _$SleepModeTimeStateImpl>
    implements _$$SleepModeTimeStateImplCopyWith<$Res> {
  __$$SleepModeTimeStateImplCopyWithImpl(_$SleepModeTimeStateImpl _value,
      $Res Function(_$SleepModeTimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTime = null,
    Object? endTime = null,
  }) {
    return _then(_$SleepModeTimeStateImpl(
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SleepModeTimeStateImpl implements _SleepModeTimeState {
  const _$SleepModeTimeStateImpl(
      {required this.currentTime, required this.endTime});

  @override
  final DateTime currentTime;
  @override
  final DateTime endTime;

  @override
  String toString() {
    return 'SleepModeTimeState(currentTime: $currentTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepModeTimeStateImpl &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepModeTimeStateImplCopyWith<_$SleepModeTimeStateImpl> get copyWith =>
      __$$SleepModeTimeStateImplCopyWithImpl<_$SleepModeTimeStateImpl>(
          this, _$identity);
}

abstract class _SleepModeTimeState implements SleepModeTimeState {
  const factory _SleepModeTimeState(
      {required final DateTime currentTime,
      required final DateTime endTime}) = _$SleepModeTimeStateImpl;

  @override
  DateTime get currentTime;
  @override
  DateTime get endTime;
  @override
  @JsonKey(ignore: true)
  _$$SleepModeTimeStateImplCopyWith<_$SleepModeTimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
