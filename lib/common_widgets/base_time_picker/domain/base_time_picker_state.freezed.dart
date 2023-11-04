// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_time_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseTimePickerState {
  Time? get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseTimePickerStateCopyWith<BaseTimePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseTimePickerStateCopyWith<$Res> {
  factory $BaseTimePickerStateCopyWith(
          BaseTimePickerState value, $Res Function(BaseTimePickerState) then) =
      _$BaseTimePickerStateCopyWithImpl<$Res, BaseTimePickerState>;
  @useResult
  $Res call({Time? time});
}

/// @nodoc
class _$BaseTimePickerStateCopyWithImpl<$Res, $Val extends BaseTimePickerState>
    implements $BaseTimePickerStateCopyWith<$Res> {
  _$BaseTimePickerStateCopyWithImpl(this._value, this._then);

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
abstract class _$$BaseTimePickerStateImplCopyWith<$Res>
    implements $BaseTimePickerStateCopyWith<$Res> {
  factory _$$BaseTimePickerStateImplCopyWith(_$BaseTimePickerStateImpl value,
          $Res Function(_$BaseTimePickerStateImpl) then) =
      __$$BaseTimePickerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Time? time});
}

/// @nodoc
class __$$BaseTimePickerStateImplCopyWithImpl<$Res>
    extends _$BaseTimePickerStateCopyWithImpl<$Res, _$BaseTimePickerStateImpl>
    implements _$$BaseTimePickerStateImplCopyWith<$Res> {
  __$$BaseTimePickerStateImplCopyWithImpl(_$BaseTimePickerStateImpl _value,
      $Res Function(_$BaseTimePickerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_$BaseTimePickerStateImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time?,
    ));
  }
}

/// @nodoc

class _$BaseTimePickerStateImpl implements _BaseTimePickerState {
  const _$BaseTimePickerStateImpl({this.time});

  @override
  final Time? time;

  @override
  String toString() {
    return 'BaseTimePickerState(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseTimePickerStateImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseTimePickerStateImplCopyWith<_$BaseTimePickerStateImpl> get copyWith =>
      __$$BaseTimePickerStateImplCopyWithImpl<_$BaseTimePickerStateImpl>(
          this, _$identity);
}

abstract class _BaseTimePickerState implements BaseTimePickerState {
  const factory _BaseTimePickerState({final Time? time}) =
      _$BaseTimePickerStateImpl;

  @override
  Time? get time;
  @override
  @JsonKey(ignore: true)
  _$$BaseTimePickerStateImplCopyWith<_$BaseTimePickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
