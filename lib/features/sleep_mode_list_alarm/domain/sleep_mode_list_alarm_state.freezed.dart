// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_mode_list_alarm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepModeListAlarmState {
  List<AlarmHistory> get alarmHistories => throw _privateConstructorUsedError;
  AlarmHistory? get selectedAlarmHistory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepModeListAlarmStateCopyWith<SleepModeListAlarmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepModeListAlarmStateCopyWith<$Res> {
  factory $SleepModeListAlarmStateCopyWith(SleepModeListAlarmState value,
          $Res Function(SleepModeListAlarmState) then) =
      _$SleepModeListAlarmStateCopyWithImpl<$Res, SleepModeListAlarmState>;
  @useResult
  $Res call(
      {List<AlarmHistory> alarmHistories, AlarmHistory? selectedAlarmHistory});
}

/// @nodoc
class _$SleepModeListAlarmStateCopyWithImpl<$Res,
        $Val extends SleepModeListAlarmState>
    implements $SleepModeListAlarmStateCopyWith<$Res> {
  _$SleepModeListAlarmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarmHistories = null,
    Object? selectedAlarmHistory = freezed,
  }) {
    return _then(_value.copyWith(
      alarmHistories: null == alarmHistories
          ? _value.alarmHistories
          : alarmHistories // ignore: cast_nullable_to_non_nullable
              as List<AlarmHistory>,
      selectedAlarmHistory: freezed == selectedAlarmHistory
          ? _value.selectedAlarmHistory
          : selectedAlarmHistory // ignore: cast_nullable_to_non_nullable
              as AlarmHistory?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepModeListAlarmStateImplCopyWith<$Res>
    implements $SleepModeListAlarmStateCopyWith<$Res> {
  factory _$$SleepModeListAlarmStateImplCopyWith(
          _$SleepModeListAlarmStateImpl value,
          $Res Function(_$SleepModeListAlarmStateImpl) then) =
      __$$SleepModeListAlarmStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AlarmHistory> alarmHistories, AlarmHistory? selectedAlarmHistory});
}

/// @nodoc
class __$$SleepModeListAlarmStateImplCopyWithImpl<$Res>
    extends _$SleepModeListAlarmStateCopyWithImpl<$Res,
        _$SleepModeListAlarmStateImpl>
    implements _$$SleepModeListAlarmStateImplCopyWith<$Res> {
  __$$SleepModeListAlarmStateImplCopyWithImpl(
      _$SleepModeListAlarmStateImpl _value,
      $Res Function(_$SleepModeListAlarmStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarmHistories = null,
    Object? selectedAlarmHistory = freezed,
  }) {
    return _then(_$SleepModeListAlarmStateImpl(
      alarmHistories: null == alarmHistories
          ? _value._alarmHistories
          : alarmHistories // ignore: cast_nullable_to_non_nullable
              as List<AlarmHistory>,
      selectedAlarmHistory: freezed == selectedAlarmHistory
          ? _value.selectedAlarmHistory
          : selectedAlarmHistory // ignore: cast_nullable_to_non_nullable
              as AlarmHistory?,
    ));
  }
}

/// @nodoc

class _$SleepModeListAlarmStateImpl implements _SleepModeListAlarmState {
  const _$SleepModeListAlarmStateImpl(
      {final List<AlarmHistory> alarmHistories = const [],
      this.selectedAlarmHistory})
      : _alarmHistories = alarmHistories;

  final List<AlarmHistory> _alarmHistories;
  @override
  @JsonKey()
  List<AlarmHistory> get alarmHistories {
    if (_alarmHistories is EqualUnmodifiableListView) return _alarmHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alarmHistories);
  }

  @override
  final AlarmHistory? selectedAlarmHistory;

  @override
  String toString() {
    return 'SleepModeListAlarmState(alarmHistories: $alarmHistories, selectedAlarmHistory: $selectedAlarmHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepModeListAlarmStateImpl &&
            const DeepCollectionEquality()
                .equals(other._alarmHistories, _alarmHistories) &&
            (identical(other.selectedAlarmHistory, selectedAlarmHistory) ||
                other.selectedAlarmHistory == selectedAlarmHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_alarmHistories),
      selectedAlarmHistory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepModeListAlarmStateImplCopyWith<_$SleepModeListAlarmStateImpl>
      get copyWith => __$$SleepModeListAlarmStateImplCopyWithImpl<
          _$SleepModeListAlarmStateImpl>(this, _$identity);
}

abstract class _SleepModeListAlarmState implements SleepModeListAlarmState {
  const factory _SleepModeListAlarmState(
          {final List<AlarmHistory> alarmHistories,
          final AlarmHistory? selectedAlarmHistory}) =
      _$SleepModeListAlarmStateImpl;

  @override
  List<AlarmHistory> get alarmHistories;
  @override
  AlarmHistory? get selectedAlarmHistory;
  @override
  @JsonKey(ignore: true)
  _$$SleepModeListAlarmStateImplCopyWith<_$SleepModeListAlarmStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
