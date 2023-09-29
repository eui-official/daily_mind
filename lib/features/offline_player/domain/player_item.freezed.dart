// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerItem {
  GaplessAudioPlayer get player => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerItemCopyWith<PlayerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerItemCopyWith<$Res> {
  factory $PlayerItemCopyWith(
          PlayerItem value, $Res Function(PlayerItem) then) =
      _$PlayerItemCopyWithImpl<$Res, PlayerItem>;
  @useResult
  $Res call({GaplessAudioPlayer player, String id});
}

/// @nodoc
class _$PlayerItemCopyWithImpl<$Res, $Val extends PlayerItem>
    implements $PlayerItemCopyWith<$Res> {
  _$PlayerItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as GaplessAudioPlayer,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerItemCopyWith<$Res>
    implements $PlayerItemCopyWith<$Res> {
  factory _$$_PlayerItemCopyWith(
          _$_PlayerItem value, $Res Function(_$_PlayerItem) then) =
      __$$_PlayerItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GaplessAudioPlayer player, String id});
}

/// @nodoc
class __$$_PlayerItemCopyWithImpl<$Res>
    extends _$PlayerItemCopyWithImpl<$Res, _$_PlayerItem>
    implements _$$_PlayerItemCopyWith<$Res> {
  __$$_PlayerItemCopyWithImpl(
      _$_PlayerItem _value, $Res Function(_$_PlayerItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? id = null,
  }) {
    return _then(_$_PlayerItem(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as GaplessAudioPlayer,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PlayerItem implements _PlayerItem {
  const _$_PlayerItem({required this.player, required this.id});

  @override
  final GaplessAudioPlayer player;
  @override
  final String id;

  @override
  String toString() {
    return 'PlayerItem(player: $player, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerItem &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, player, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerItemCopyWith<_$_PlayerItem> get copyWith =>
      __$$_PlayerItemCopyWithImpl<_$_PlayerItem>(this, _$identity);
}

abstract class _PlayerItem implements PlayerItem {
  const factory _PlayerItem(
      {required final GaplessAudioPlayer player,
      required final String id}) = _$_PlayerItem;

  @override
  GaplessAudioPlayer get player;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerItemCopyWith<_$_PlayerItem> get copyWith =>
      throw _privateConstructorUsedError;
}
