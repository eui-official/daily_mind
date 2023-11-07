// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_mode_pomodoro_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FocusModePomodoroState {
  String get title => throw _privateConstructorUsedError;
  String get iconId => throw _privateConstructorUsedError;
  int get workingSessions => throw _privateConstructorUsedError;
  int get shortBreak => throw _privateConstructorUsedError;
  int get longBreak => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusModePomodoroStateCopyWith<FocusModePomodoroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusModePomodoroStateCopyWith<$Res> {
  factory $FocusModePomodoroStateCopyWith(FocusModePomodoroState value,
          $Res Function(FocusModePomodoroState) then) =
      _$FocusModePomodoroStateCopyWithImpl<$Res, FocusModePomodoroState>;
  @useResult
  $Res call(
      {String title,
      String iconId,
      int workingSessions,
      int shortBreak,
      int longBreak});
}

/// @nodoc
class _$FocusModePomodoroStateCopyWithImpl<$Res,
        $Val extends FocusModePomodoroState>
    implements $FocusModePomodoroStateCopyWith<$Res> {
  _$FocusModePomodoroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? iconId = null,
    Object? workingSessions = null,
    Object? shortBreak = null,
    Object? longBreak = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: null == iconId
          ? _value.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FocusModePomodoroStateImplCopyWith<$Res>
    implements $FocusModePomodoroStateCopyWith<$Res> {
  factory _$$FocusModePomodoroStateImplCopyWith(
          _$FocusModePomodoroStateImpl value,
          $Res Function(_$FocusModePomodoroStateImpl) then) =
      __$$FocusModePomodoroStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String iconId,
      int workingSessions,
      int shortBreak,
      int longBreak});
}

/// @nodoc
class __$$FocusModePomodoroStateImplCopyWithImpl<$Res>
    extends _$FocusModePomodoroStateCopyWithImpl<$Res,
        _$FocusModePomodoroStateImpl>
    implements _$$FocusModePomodoroStateImplCopyWith<$Res> {
  __$$FocusModePomodoroStateImplCopyWithImpl(
      _$FocusModePomodoroStateImpl _value,
      $Res Function(_$FocusModePomodoroStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? iconId = null,
    Object? workingSessions = null,
    Object? shortBreak = null,
    Object? longBreak = null,
  }) {
    return _then(_$FocusModePomodoroStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: null == iconId
          ? _value.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
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

class _$FocusModePomodoroStateImpl implements _FocusModePomodoroState {
  const _$FocusModePomodoroStateImpl(
      {required this.title,
      required this.iconId,
      required this.workingSessions,
      required this.shortBreak,
      required this.longBreak});

  @override
  final String title;
  @override
  final String iconId;
  @override
  final int workingSessions;
  @override
  final int shortBreak;
  @override
  final int longBreak;

  @override
  String toString() {
    return 'FocusModePomodoroState(title: $title, iconId: $iconId, workingSessions: $workingSessions, shortBreak: $shortBreak, longBreak: $longBreak)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusModePomodoroStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.iconId, iconId) || other.iconId == iconId) &&
            (identical(other.workingSessions, workingSessions) ||
                other.workingSessions == workingSessions) &&
            (identical(other.shortBreak, shortBreak) ||
                other.shortBreak == shortBreak) &&
            (identical(other.longBreak, longBreak) ||
                other.longBreak == longBreak));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, iconId, workingSessions, shortBreak, longBreak);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusModePomodoroStateImplCopyWith<_$FocusModePomodoroStateImpl>
      get copyWith => __$$FocusModePomodoroStateImplCopyWithImpl<
          _$FocusModePomodoroStateImpl>(this, _$identity);
}

abstract class _FocusModePomodoroState implements FocusModePomodoroState {
  const factory _FocusModePomodoroState(
      {required final String title,
      required final String iconId,
      required final int workingSessions,
      required final int shortBreak,
      required final int longBreak}) = _$FocusModePomodoroStateImpl;

  @override
  String get title;
  @override
  String get iconId;
  @override
  int get workingSessions;
  @override
  int get shortBreak;
  @override
  int get longBreak;
  @override
  @JsonKey(ignore: true)
  _$$FocusModePomodoroStateImplCopyWith<_$FocusModePomodoroStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
