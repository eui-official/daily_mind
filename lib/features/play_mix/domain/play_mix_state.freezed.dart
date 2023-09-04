// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_mix_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayMixState {
  bool get isPlaying => throw _privateConstructorUsedError;
  List<PlayerItem> get playerItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayMixStateCopyWith<PlayMixState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayMixStateCopyWith<$Res> {
  factory $PlayMixStateCopyWith(
          PlayMixState value, $Res Function(PlayMixState) then) =
      _$PlayMixStateCopyWithImpl<$Res, PlayMixState>;
  @useResult
  $Res call({bool isPlaying, List<PlayerItem> playerItems});
}

/// @nodoc
class _$PlayMixStateCopyWithImpl<$Res, $Val extends PlayMixState>
    implements $PlayMixStateCopyWith<$Res> {
  _$PlayMixStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? playerItems = null,
  }) {
    return _then(_value.copyWith(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      playerItems: null == playerItems
          ? _value.playerItems
          : playerItems // ignore: cast_nullable_to_non_nullable
              as List<PlayerItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayMixStateCopyWith<$Res>
    implements $PlayMixStateCopyWith<$Res> {
  factory _$$_PlayMixStateCopyWith(
          _$_PlayMixState value, $Res Function(_$_PlayMixState) then) =
      __$$_PlayMixStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPlaying, List<PlayerItem> playerItems});
}

/// @nodoc
class __$$_PlayMixStateCopyWithImpl<$Res>
    extends _$PlayMixStateCopyWithImpl<$Res, _$_PlayMixState>
    implements _$$_PlayMixStateCopyWith<$Res> {
  __$$_PlayMixStateCopyWithImpl(
      _$_PlayMixState _value, $Res Function(_$_PlayMixState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? playerItems = null,
  }) {
    return _then(_$_PlayMixState(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      playerItems: null == playerItems
          ? _value._playerItems
          : playerItems // ignore: cast_nullable_to_non_nullable
              as List<PlayerItem>,
    ));
  }
}

/// @nodoc

class _$_PlayMixState implements _PlayMixState {
  const _$_PlayMixState(
      {required this.isPlaying, required final List<PlayerItem> playerItems})
      : _playerItems = playerItems;

  @override
  final bool isPlaying;
  final List<PlayerItem> _playerItems;
  @override
  List<PlayerItem> get playerItems {
    if (_playerItems is EqualUnmodifiableListView) return _playerItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerItems);
  }

  @override
  String toString() {
    return 'PlayMixState(isPlaying: $isPlaying, playerItems: $playerItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayMixState &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            const DeepCollectionEquality()
                .equals(other._playerItems, _playerItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPlaying,
      const DeepCollectionEquality().hash(_playerItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayMixStateCopyWith<_$_PlayMixState> get copyWith =>
      __$$_PlayMixStateCopyWithImpl<_$_PlayMixState>(this, _$identity);
}

abstract class _PlayMixState implements PlayMixState {
  const factory _PlayMixState(
      {required final bool isPlaying,
      required final List<PlayerItem> playerItems}) = _$_PlayMixState;

  @override
  bool get isPlaying;
  @override
  List<PlayerItem> get playerItems;
  @override
  @JsonKey(ignore: true)
  _$$_PlayMixStateCopyWith<_$_PlayMixState> get copyWith =>
      throw _privateConstructorUsedError;
}
