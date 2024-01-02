// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mix_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MixItem {
  String get id => throw _privateConstructorUsedError;
  GaplessAudioPlayer get player => throw _privateConstructorUsedError;
  AudioOffline get audio => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, GaplessAudioPlayer player, AudioOffline audio)
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, GaplessAudioPlayer player, AudioOffline audio)?
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, GaplessAudioPlayer player, AudioOffline audio)?
        def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MixItem value) def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MixItem value)? def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MixItem value)? def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MixItemCopyWith<MixItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixItemCopyWith<$Res> {
  factory $MixItemCopyWith(MixItem value, $Res Function(MixItem) then) =
      _$MixItemCopyWithImpl<$Res, MixItem>;
  @useResult
  $Res call({String id, GaplessAudioPlayer player, AudioOffline audio});
}

/// @nodoc
class _$MixItemCopyWithImpl<$Res, $Val extends MixItem>
    implements $MixItemCopyWith<$Res> {
  _$MixItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player = null,
    Object? audio = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as GaplessAudioPlayer,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as AudioOffline,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MixItemImplCopyWith<$Res> implements $MixItemCopyWith<$Res> {
  factory _$$MixItemImplCopyWith(
          _$MixItemImpl value, $Res Function(_$MixItemImpl) then) =
      __$$MixItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, GaplessAudioPlayer player, AudioOffline audio});
}

/// @nodoc
class __$$MixItemImplCopyWithImpl<$Res>
    extends _$MixItemCopyWithImpl<$Res, _$MixItemImpl>
    implements _$$MixItemImplCopyWith<$Res> {
  __$$MixItemImplCopyWithImpl(
      _$MixItemImpl _value, $Res Function(_$MixItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player = null,
    Object? audio = null,
  }) {
    return _then(_$MixItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as GaplessAudioPlayer,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as AudioOffline,
    ));
  }
}

/// @nodoc

class _$MixItemImpl implements _MixItem {
  _$MixItemImpl({required this.id, required this.player, required this.audio});

  @override
  final String id;
  @override
  final GaplessAudioPlayer player;
  @override
  final AudioOffline audio;

  @override
  String toString() {
    return 'MixItem.def(id: $id, player: $player, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MixItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, player, audio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MixItemImplCopyWith<_$MixItemImpl> get copyWith =>
      __$$MixItemImplCopyWithImpl<_$MixItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, GaplessAudioPlayer player, AudioOffline audio)
        def,
  }) {
    return def(id, player, audio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, GaplessAudioPlayer player, AudioOffline audio)?
        def,
  }) {
    return def?.call(id, player, audio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, GaplessAudioPlayer player, AudioOffline audio)?
        def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(id, player, audio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MixItem value) def,
  }) {
    return def(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MixItem value)? def,
  }) {
    return def?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MixItem value)? def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(this);
    }
    return orElse();
  }
}

abstract class _MixItem implements MixItem {
  factory _MixItem(
      {required final String id,
      required final GaplessAudioPlayer player,
      required final AudioOffline audio}) = _$MixItemImpl;

  @override
  String get id;
  @override
  GaplessAudioPlayer get player;
  @override
  AudioOffline get audio;
  @override
  @JsonKey(ignore: true)
  _$$MixItemImplCopyWith<_$MixItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
