// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_mode_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FocusModeTaskState {
  String get title => throw _privateConstructorUsedError;
  int get workingSessions => throw _privateConstructorUsedError;
  int get shortBreak => throw _privateConstructorUsedError;
  int get longBreak => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusModeTaskStateCopyWith<FocusModeTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusModeTaskStateCopyWith<$Res> {
  factory $FocusModeTaskStateCopyWith(
          FocusModeTaskState value, $Res Function(FocusModeTaskState) then) =
      _$FocusModeTaskStateCopyWithImpl<$Res, FocusModeTaskState>;
  @useResult
  $Res call({String title, int workingSessions, int shortBreak, int longBreak});
}

/// @nodoc
class _$FocusModeTaskStateCopyWithImpl<$Res, $Val extends FocusModeTaskState>
    implements $FocusModeTaskStateCopyWith<$Res> {
  _$FocusModeTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? workingSessions = null,
    Object? shortBreak = null,
    Object? longBreak = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      workingSessions: null == workingSessions
          ? _value.workingSessions
          : workingSessions // ignore: cast_nullable_to_non_nullable
              as int,
      shortBreak: null == shortBreak
          ? _value.shortBreak
          : shortBreak // ignore: cast_nullable_to_non_nullable
              as int,
      longBreak: null == longBreak
          ? _value.longBreak
          : longBreak // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FocusModeTaskStateImplCopyWith<$Res>
    implements $FocusModeTaskStateCopyWith<$Res> {
  factory _$$FocusModeTaskStateImplCopyWith(_$FocusModeTaskStateImpl value,
          $Res Function(_$FocusModeTaskStateImpl) then) =
      __$$FocusModeTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int workingSessions, int shortBreak, int longBreak});
}

/// @nodoc
class __$$FocusModeTaskStateImplCopyWithImpl<$Res>
    extends _$FocusModeTaskStateCopyWithImpl<$Res, _$FocusModeTaskStateImpl>
    implements _$$FocusModeTaskStateImplCopyWith<$Res> {
  __$$FocusModeTaskStateImplCopyWithImpl(_$FocusModeTaskStateImpl _value,
      $Res Function(_$FocusModeTaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? workingSessions = null,
    Object? shortBreak = null,
    Object? longBreak = null,
  }) {
    return _then(_$FocusModeTaskStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      workingSessions: null == workingSessions
          ? _value.workingSessions
          : workingSessions // ignore: cast_nullable_to_non_nullable
              as int,
      shortBreak: null == shortBreak
          ? _value.shortBreak
          : shortBreak // ignore: cast_nullable_to_non_nullable
              as int,
      longBreak: null == longBreak
          ? _value.longBreak
          : longBreak // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FocusModeTaskStateImpl implements _FocusModeTaskState {
  const _$FocusModeTaskStateImpl(
      {required this.title,
      required this.workingSessions,
      required this.shortBreak,
      required this.longBreak});

  @override
  final String title;
  @override
  final int workingSessions;
  @override
  final int shortBreak;
  @override
  final int longBreak;

  @override
  String toString() {
    return 'FocusModeTaskState(title: $title, workingSessions: $workingSessions, shortBreak: $shortBreak, longBreak: $longBreak)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusModeTaskStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.workingSessions, workingSessions) ||
                other.workingSessions == workingSessions) &&
            (identical(other.shortBreak, shortBreak) ||
                other.shortBreak == shortBreak) &&
            (identical(other.longBreak, longBreak) ||
                other.longBreak == longBreak));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, workingSessions, shortBreak, longBreak);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusModeTaskStateImplCopyWith<_$FocusModeTaskStateImpl> get copyWith =>
      __$$FocusModeTaskStateImplCopyWithImpl<_$FocusModeTaskStateImpl>(
          this, _$identity);
}

abstract class _FocusModeTaskState implements FocusModeTaskState {
  const factory _FocusModeTaskState(
      {required final String title,
      required final int workingSessions,
      required final int shortBreak,
      required final int longBreak}) = _$FocusModeTaskStateImpl;

  @override
  String get title;
  @override
  int get workingSessions;
  @override
  int get shortBreak;
  @override
  int get longBreak;
  @override
  @JsonKey(ignore: true)
  _$$FocusModeTaskStateImplCopyWith<_$FocusModeTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
