// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_player_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OfflinePlayerItem {
  GaplessAudioPlayer get player => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OfflinePlayerItemCopyWith<OfflinePlayerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflinePlayerItemCopyWith<$Res> {
  factory $OfflinePlayerItemCopyWith(
          OfflinePlayerItem value, $Res Function(OfflinePlayerItem) then) =
      _$OfflinePlayerItemCopyWithImpl<$Res, OfflinePlayerItem>;
  @useResult
  $Res call({GaplessAudioPlayer player, String id});
}

/// @nodoc
class _$OfflinePlayerItemCopyWithImpl<$Res, $Val extends OfflinePlayerItem>
    implements $OfflinePlayerItemCopyWith<$Res> {
  _$OfflinePlayerItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_OfflinePlayerItemCopyWith<$Res>
    implements $OfflinePlayerItemCopyWith<$Res> {
  factory _$$_OfflinePlayerItemCopyWith(_$_OfflinePlayerItem value,
          $Res Function(_$_OfflinePlayerItem) then) =
      __$$_OfflinePlayerItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GaplessAudioPlayer player, String id});
}

/// @nodoc
class __$$_OfflinePlayerItemCopyWithImpl<$Res>
    extends _$OfflinePlayerItemCopyWithImpl<$Res, _$_OfflinePlayerItem>
    implements _$$_OfflinePlayerItemCopyWith<$Res> {
  __$$_OfflinePlayerItemCopyWithImpl(
      _$_OfflinePlayerItem _value, $Res Function(_$_OfflinePlayerItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? id = null,
  }) {
    return _then(_$_OfflinePlayerItem(
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

class _$_OfflinePlayerItem implements _OfflinePlayerItem {
  const _$_OfflinePlayerItem({required this.player, required this.id});

  @override
  final GaplessAudioPlayer player;
  @override
  final String id;

  @override
  String toString() {
    return 'OfflinePlayerItem(player: $player, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfflinePlayerItem &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, player, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfflinePlayerItemCopyWith<_$_OfflinePlayerItem> get copyWith =>
      __$$_OfflinePlayerItemCopyWithImpl<_$_OfflinePlayerItem>(
          this, _$identity);
}

abstract class _OfflinePlayerItem implements OfflinePlayerItem {
  const factory _OfflinePlayerItem(
      {required final GaplessAudioPlayer player,
      required final String id}) = _$_OfflinePlayerItem;

  @override
  GaplessAudioPlayer get player;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_OfflinePlayerItemCopyWith<_$_OfflinePlayerItem> get copyWith =>
      throw _privateConstructorUsedError;
}
