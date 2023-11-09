// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_mode_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FocusModeSessionState {
  FocusModeSessionSteps get currentStep => throw _privateConstructorUsedError;
  int get currentSession => throw _privateConstructorUsedError;
  int get totalSeconds => throw _privateConstructorUsedError;
  int get remainingSeconds => throw _privateConstructorUsedError;
  Pomodoro get pomodoro => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusModeSessionStateCopyWith<FocusModeSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusModeSessionStateCopyWith<$Res> {
  factory $FocusModeSessionStateCopyWith(FocusModeSessionState value,
          $Res Function(FocusModeSessionState) then) =
      _$FocusModeSessionStateCopyWithImpl<$Res, FocusModeSessionState>;
  @useResult
  $Res call(
      {FocusModeSessionSteps currentStep,
      int currentSession,
      int totalSeconds,
      int remainingSeconds,
      Pomodoro pomodoro,
      bool isPlaying});
}

/// @nodoc
class _$FocusModeSessionStateCopyWithImpl<$Res,
        $Val extends FocusModeSessionState>
    implements $FocusModeSessionStateCopyWith<$Res> {
  _$FocusModeSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? currentSession = null,
    Object? totalSeconds = null,
    Object? remainingSeconds = null,
    Object? pomodoro = null,
    Object? isPlaying = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as FocusModeSessionSteps,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeconds: null == totalSeconds
          ? _value.totalSeconds
          : totalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      remainingSeconds: null == remainingSeconds
          ? _value.remainingSeconds
          : remainingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoro: null == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as Pomodoro,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FocusModeSessionStateImplCopyWith<$Res>
    implements $FocusModeSessionStateCopyWith<$Res> {
  factory _$$FocusModeSessionStateImplCopyWith(
          _$FocusModeSessionStateImpl value,
          $Res Function(_$FocusModeSessionStateImpl) then) =
      __$$FocusModeSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FocusModeSessionSteps currentStep,
      int currentSession,
      int totalSeconds,
      int remainingSeconds,
      Pomodoro pomodoro,
      bool isPlaying});
}

/// @nodoc
class __$$FocusModeSessionStateImplCopyWithImpl<$Res>
    extends _$FocusModeSessionStateCopyWithImpl<$Res,
        _$FocusModeSessionStateImpl>
    implements _$$FocusModeSessionStateImplCopyWith<$Res> {
  __$$FocusModeSessionStateImplCopyWithImpl(_$FocusModeSessionStateImpl _value,
      $Res Function(_$FocusModeSessionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? currentSession = null,
    Object? totalSeconds = null,
    Object? remainingSeconds = null,
    Object? pomodoro = null,
    Object? isPlaying = null,
  }) {
    return _then(_$FocusModeSessionStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as FocusModeSessionSteps,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeconds: null == totalSeconds
          ? _value.totalSeconds
          : totalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      remainingSeconds: null == remainingSeconds
          ? _value.remainingSeconds
          : remainingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoro: null == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as Pomodoro,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FocusModeSessionStateImpl extends _FocusModeSessionState {
  const _$FocusModeSessionStateImpl(
      {required this.currentStep,
      required this.currentSession,
      required this.totalSeconds,
      required this.remainingSeconds,
      required this.pomodoro,
      required this.isPlaying})
      : super._();

  @override
  final FocusModeSessionSteps currentStep;
  @override
  final int currentSession;
  @override
  final int totalSeconds;
  @override
  final int remainingSeconds;
  @override
  final Pomodoro pomodoro;
  @override
  final bool isPlaying;

  @override
  String toString() {
    return 'FocusModeSessionState(currentStep: $currentStep, currentSession: $currentSession, totalSeconds: $totalSeconds, remainingSeconds: $remainingSeconds, pomodoro: $pomodoro, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusModeSessionStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.currentSession, currentSession) ||
                other.currentSession == currentSession) &&
            (identical(other.totalSeconds, totalSeconds) ||
                other.totalSeconds == totalSeconds) &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.pomodoro, pomodoro) ||
                other.pomodoro == pomodoro) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, currentSession,
      totalSeconds, remainingSeconds, pomodoro, isPlaying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusModeSessionStateImplCopyWith<_$FocusModeSessionStateImpl>
      get copyWith => __$$FocusModeSessionStateImplCopyWithImpl<
          _$FocusModeSessionStateImpl>(this, _$identity);
}

abstract class _FocusModeSessionState extends FocusModeSessionState {
  const factory _FocusModeSessionState(
      {required final FocusModeSessionSteps currentStep,
      required final int currentSession,
      required final int totalSeconds,
      required final int remainingSeconds,
      required final Pomodoro pomodoro,
      required final bool isPlaying}) = _$FocusModeSessionStateImpl;
  const _FocusModeSessionState._() : super._();

  @override
  FocusModeSessionSteps get currentStep;
  @override
  int get currentSession;
  @override
  int get totalSeconds;
  @override
  int get remainingSeconds;
  @override
  Pomodoro get pomodoro;
  @override
  bool get isPlaying;
  @override
  @JsonKey(ignore: true)
  _$$FocusModeSessionStateImplCopyWith<_$FocusModeSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
