// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_audio_ids_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseAudioIdsState {
  List<Audio> get audios => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseAudioIdsStateCopyWith<BaseAudioIdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseAudioIdsStateCopyWith<$Res> {
  factory $BaseAudioIdsStateCopyWith(
          BaseAudioIdsState value, $Res Function(BaseAudioIdsState) then) =
      _$BaseAudioIdsStateCopyWithImpl<$Res, BaseAudioIdsState>;
  @useResult
  $Res call({List<Audio> audios});
}

/// @nodoc
class _$BaseAudioIdsStateCopyWithImpl<$Res, $Val extends BaseAudioIdsState>
    implements $BaseAudioIdsStateCopyWith<$Res> {
  _$BaseAudioIdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audios = null,
  }) {
    return _then(_value.copyWith(
      audios: null == audios
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseAudioIdsStateImplCopyWith<$Res>
    implements $BaseAudioIdsStateCopyWith<$Res> {
  factory _$$BaseAudioIdsStateImplCopyWith(_$BaseAudioIdsStateImpl value,
          $Res Function(_$BaseAudioIdsStateImpl) then) =
      __$$BaseAudioIdsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Audio> audios});
}

/// @nodoc
class __$$BaseAudioIdsStateImplCopyWithImpl<$Res>
    extends _$BaseAudioIdsStateCopyWithImpl<$Res, _$BaseAudioIdsStateImpl>
    implements _$$BaseAudioIdsStateImplCopyWith<$Res> {
  __$$BaseAudioIdsStateImplCopyWithImpl(_$BaseAudioIdsStateImpl _value,
      $Res Function(_$BaseAudioIdsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audios = null,
  }) {
    return _then(_$BaseAudioIdsStateImpl(
      audios: null == audios
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
    ));
  }
}

/// @nodoc

class _$BaseAudioIdsStateImpl implements _BaseAudioIdsState {
  const _$BaseAudioIdsStateImpl({required final List<Audio> audios})
      : _audios = audios;

  final List<Audio> _audios;
  @override
  List<Audio> get audios {
    if (_audios is EqualUnmodifiableListView) return _audios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audios);
  }

  @override
  String toString() {
    return 'BaseAudioIdsState(audios: $audios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseAudioIdsStateImpl &&
            const DeepCollectionEquality().equals(other._audios, _audios));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_audios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseAudioIdsStateImplCopyWith<_$BaseAudioIdsStateImpl> get copyWith =>
      __$$BaseAudioIdsStateImplCopyWithImpl<_$BaseAudioIdsStateImpl>(
          this, _$identity);
}

abstract class _BaseAudioIdsState implements BaseAudioIdsState {
  const factory _BaseAudioIdsState({required final List<Audio> audios}) =
      _$BaseAudioIdsStateImpl;

  @override
  List<Audio> get audios;
  @override
  @JsonKey(ignore: true)
  _$$BaseAudioIdsStateImplCopyWith<_$BaseAudioIdsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
