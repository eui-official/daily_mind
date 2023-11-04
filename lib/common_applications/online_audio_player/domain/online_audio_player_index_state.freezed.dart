// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_audio_player_index_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnlineAudioPlayerIndexState {
  int get index => throw _privateConstructorUsedError;
  int get sequenceLength => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlineAudioPlayerIndexStateCopyWith<OnlineAudioPlayerIndexState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineAudioPlayerIndexStateCopyWith<$Res> {
  factory $OnlineAudioPlayerIndexStateCopyWith(
          OnlineAudioPlayerIndexState value,
          $Res Function(OnlineAudioPlayerIndexState) then) =
      _$OnlineAudioPlayerIndexStateCopyWithImpl<$Res,
          OnlineAudioPlayerIndexState>;
  @useResult
  $Res call({int index, int sequenceLength});
}

/// @nodoc
class _$OnlineAudioPlayerIndexStateCopyWithImpl<$Res,
        $Val extends OnlineAudioPlayerIndexState>
    implements $OnlineAudioPlayerIndexStateCopyWith<$Res> {
  _$OnlineAudioPlayerIndexStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? sequenceLength = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      sequenceLength: null == sequenceLength
          ? _value.sequenceLength
          : sequenceLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnlineAudioPlayerIndexStateImplCopyWith<$Res>
    implements $OnlineAudioPlayerIndexStateCopyWith<$Res> {
  factory _$$OnlineAudioPlayerIndexStateImplCopyWith(
          _$OnlineAudioPlayerIndexStateImpl value,
          $Res Function(_$OnlineAudioPlayerIndexStateImpl) then) =
      __$$OnlineAudioPlayerIndexStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, int sequenceLength});
}

/// @nodoc
class __$$OnlineAudioPlayerIndexStateImplCopyWithImpl<$Res>
    extends _$OnlineAudioPlayerIndexStateCopyWithImpl<$Res,
        _$OnlineAudioPlayerIndexStateImpl>
    implements _$$OnlineAudioPlayerIndexStateImplCopyWith<$Res> {
  __$$OnlineAudioPlayerIndexStateImplCopyWithImpl(
      _$OnlineAudioPlayerIndexStateImpl _value,
      $Res Function(_$OnlineAudioPlayerIndexStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? sequenceLength = null,
  }) {
    return _then(_$OnlineAudioPlayerIndexStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      sequenceLength: null == sequenceLength
          ? _value.sequenceLength
          : sequenceLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnlineAudioPlayerIndexStateImpl extends _OnlineAudioPlayerIndexState {
  const _$OnlineAudioPlayerIndexStateImpl(
      {required this.index, required this.sequenceLength})
      : super._();

  @override
  final int index;
  @override
  final int sequenceLength;

  @override
  String toString() {
    return 'OnlineAudioPlayerIndexState(index: $index, sequenceLength: $sequenceLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineAudioPlayerIndexStateImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.sequenceLength, sequenceLength) ||
                other.sequenceLength == sequenceLength));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, sequenceLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineAudioPlayerIndexStateImplCopyWith<_$OnlineAudioPlayerIndexStateImpl>
      get copyWith => __$$OnlineAudioPlayerIndexStateImplCopyWithImpl<
          _$OnlineAudioPlayerIndexStateImpl>(this, _$identity);
}

abstract class _OnlineAudioPlayerIndexState
    extends OnlineAudioPlayerIndexState {
  const factory _OnlineAudioPlayerIndexState(
      {required final int index,
      required final int sequenceLength}) = _$OnlineAudioPlayerIndexStateImpl;
  const _OnlineAudioPlayerIndexState._() : super._();

  @override
  int get index;
  @override
  int get sequenceLength;
  @override
  @JsonKey(ignore: true)
  _$$OnlineAudioPlayerIndexStateImplCopyWith<_$OnlineAudioPlayerIndexStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
