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
  $Res call({bool isPlaying});
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
    Object? isPlaying = null,
  }) {
    return _then(_value.copyWith(
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
  $Res call({bool isPlaying});
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
    Object? isPlaying = null,
  }) {
    return _then(_$FocusModeSessionStateImpl(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FocusModeSessionStateImpl extends _FocusModeSessionState {
  const _$FocusModeSessionStateImpl({required this.isPlaying}) : super._();

  @override
  final bool isPlaying;

  @override
  String toString() {
    return 'FocusModeSessionState(isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusModeSessionStateImpl &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPlaying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusModeSessionStateImplCopyWith<_$FocusModeSessionStateImpl>
      get copyWith => __$$FocusModeSessionStateImplCopyWithImpl<
          _$FocusModeSessionStateImpl>(this, _$identity);
}

abstract class _FocusModeSessionState extends FocusModeSessionState {
  const factory _FocusModeSessionState({required final bool isPlaying}) =
      _$FocusModeSessionStateImpl;
  const _FocusModeSessionState._() : super._();

  @override
  bool get isPlaying;
  @override
  @JsonKey(ignore: true)
  _$$FocusModeSessionStateImplCopyWith<_$FocusModeSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
