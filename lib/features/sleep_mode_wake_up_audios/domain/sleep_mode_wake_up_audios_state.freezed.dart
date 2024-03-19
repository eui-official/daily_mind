// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_mode_wake_up_audios_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepModeWakeUpAudiosState {
  OfflineAudio get wakeUpOfflineAudio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepModeWakeUpAudiosStateCopyWith<SleepModeWakeUpAudiosState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepModeWakeUpAudiosStateCopyWith<$Res> {
  factory $SleepModeWakeUpAudiosStateCopyWith(SleepModeWakeUpAudiosState value,
          $Res Function(SleepModeWakeUpAudiosState) then) =
      _$SleepModeWakeUpAudiosStateCopyWithImpl<$Res,
          SleepModeWakeUpAudiosState>;
  @useResult
  $Res call({OfflineAudio wakeUpOfflineAudio});
}

/// @nodoc
class _$SleepModeWakeUpAudiosStateCopyWithImpl<$Res,
        $Val extends SleepModeWakeUpAudiosState>
    implements $SleepModeWakeUpAudiosStateCopyWith<$Res> {
  _$SleepModeWakeUpAudiosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wakeUpOfflineAudio = null,
  }) {
    return _then(_value.copyWith(
      wakeUpOfflineAudio: null == wakeUpOfflineAudio
          ? _value.wakeUpOfflineAudio
          : wakeUpOfflineAudio // ignore: cast_nullable_to_non_nullable
              as OfflineAudio,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepModeWakeUpAudiosStateImplCopyWith<$Res>
    implements $SleepModeWakeUpAudiosStateCopyWith<$Res> {
  factory _$$SleepModeWakeUpAudiosStateImplCopyWith(
          _$SleepModeWakeUpAudiosStateImpl value,
          $Res Function(_$SleepModeWakeUpAudiosStateImpl) then) =
      __$$SleepModeWakeUpAudiosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OfflineAudio wakeUpOfflineAudio});
}

/// @nodoc
class __$$SleepModeWakeUpAudiosStateImplCopyWithImpl<$Res>
    extends _$SleepModeWakeUpAudiosStateCopyWithImpl<$Res,
        _$SleepModeWakeUpAudiosStateImpl>
    implements _$$SleepModeWakeUpAudiosStateImplCopyWith<$Res> {
  __$$SleepModeWakeUpAudiosStateImplCopyWithImpl(
      _$SleepModeWakeUpAudiosStateImpl _value,
      $Res Function(_$SleepModeWakeUpAudiosStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wakeUpOfflineAudio = null,
  }) {
    return _then(_$SleepModeWakeUpAudiosStateImpl(
      wakeUpOfflineAudio: null == wakeUpOfflineAudio
          ? _value.wakeUpOfflineAudio
          : wakeUpOfflineAudio // ignore: cast_nullable_to_non_nullable
              as OfflineAudio,
    ));
  }
}

/// @nodoc

class _$SleepModeWakeUpAudiosStateImpl implements _SleepModeWakeUpAudiosState {
  const _$SleepModeWakeUpAudiosStateImpl({required this.wakeUpOfflineAudio});

  @override
  final OfflineAudio wakeUpOfflineAudio;

  @override
  String toString() {
    return 'SleepModeWakeUpAudiosState(wakeUpOfflineAudio: $wakeUpOfflineAudio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepModeWakeUpAudiosStateImpl &&
            (identical(other.wakeUpOfflineAudio, wakeUpOfflineAudio) ||
                other.wakeUpOfflineAudio == wakeUpOfflineAudio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wakeUpOfflineAudio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepModeWakeUpAudiosStateImplCopyWith<_$SleepModeWakeUpAudiosStateImpl>
      get copyWith => __$$SleepModeWakeUpAudiosStateImplCopyWithImpl<
          _$SleepModeWakeUpAudiosStateImpl>(this, _$identity);
}

abstract class _SleepModeWakeUpAudiosState
    implements SleepModeWakeUpAudiosState {
  const factory _SleepModeWakeUpAudiosState(
          {required final OfflineAudio wakeUpOfflineAudio}) =
      _$SleepModeWakeUpAudiosStateImpl;

  @override
  OfflineAudio get wakeUpOfflineAudio;
  @override
  @JsonKey(ignore: true)
  _$$SleepModeWakeUpAudiosStateImplCopyWith<_$SleepModeWakeUpAudiosStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
