// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_mode_current_time_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SleepModeCurrentTimeState {
  DateTime get currentTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepModeCurrentTimeStateCopyWith<SleepModeCurrentTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepModeCurrentTimeStateCopyWith<$Res> {
  factory $SleepModeCurrentTimeStateCopyWith(SleepModeCurrentTimeState value,
          $Res Function(SleepModeCurrentTimeState) then) =
      _$SleepModeCurrentTimeStateCopyWithImpl<$Res, SleepModeCurrentTimeState>;
  @useResult
  $Res call({DateTime currentTime, DateTime endTime});
}

/// @nodoc
class _$SleepModeCurrentTimeStateCopyWithImpl<$Res,
        $Val extends SleepModeCurrentTimeState>
    implements $SleepModeCurrentTimeStateCopyWith<$Res> {
  _$SleepModeCurrentTimeStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SleepModeCurrentTimeStateImplCopyWith<$Res>
    implements $SleepModeCurrentTimeStateCopyWith<$Res> {
  factory _$$SleepModeCurrentTimeStateImplCopyWith(
          _$SleepModeCurrentTimeStateImpl value,
          $Res Function(_$SleepModeCurrentTimeStateImpl) then) =
      __$$SleepModeCurrentTimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime currentTime, DateTime endTime});
}

/// @nodoc
class __$$SleepModeCurrentTimeStateImplCopyWithImpl<$Res>
    extends _$SleepModeCurrentTimeStateCopyWithImpl<$Res,
        _$SleepModeCurrentTimeStateImpl>
    implements _$$SleepModeCurrentTimeStateImplCopyWith<$Res> {
  __$$SleepModeCurrentTimeStateImplCopyWithImpl(
      _$SleepModeCurrentTimeStateImpl _value,
      $Res Function(_$SleepModeCurrentTimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTime = null,
    Object? endTime = null,
  }) {
    return _then(_$SleepModeCurrentTimeStateImpl(
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

class _$SleepModeCurrentTimeStateImpl implements _SleepModeCurrentTimeState {
  const _$SleepModeCurrentTimeStateImpl(
      {required this.currentTime, required this.endTime});

  @override
  final DateTime currentTime;
  @override
  final DateTime endTime;

  @override
  String toString() {
    return 'SleepModeCurrentTimeState(currentTime: $currentTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepModeCurrentTimeStateImpl &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepModeCurrentTimeStateImplCopyWith<_$SleepModeCurrentTimeStateImpl>
      get copyWith => __$$SleepModeCurrentTimeStateImplCopyWithImpl<
          _$SleepModeCurrentTimeStateImpl>(this, _$identity);
}

abstract class _SleepModeCurrentTimeState implements SleepModeCurrentTimeState {
  const factory _SleepModeCurrentTimeState(
      {required final DateTime currentTime,
      required final DateTime endTime}) = _$SleepModeCurrentTimeStateImpl;

  @override
  DateTime get currentTime;
  @override
  DateTime get endTime;
  @override
  @JsonKey(ignore: true)
  _$$SleepModeCurrentTimeStateImplCopyWith<_$SleepModeCurrentTimeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
