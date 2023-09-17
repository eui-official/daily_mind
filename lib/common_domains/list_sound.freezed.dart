// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_sound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListSound _$ListSoundFromJson(Map<String, dynamic> json) {
  return _ListSound.fromJson(json);
}

/// @nodoc
mixin _$ListSound {
  List<Sound> get sounds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListSoundCopyWith<ListSound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSoundCopyWith<$Res> {
  factory $ListSoundCopyWith(ListSound value, $Res Function(ListSound) then) =
      _$ListSoundCopyWithImpl<$Res, ListSound>;
  @useResult
  $Res call({List<Sound> sounds});
}

/// @nodoc
class _$ListSoundCopyWithImpl<$Res, $Val extends ListSound>
    implements $ListSoundCopyWith<$Res> {
  _$ListSoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sounds = null,
  }) {
    return _then(_value.copyWith(
      sounds: null == sounds
          ? _value.sounds
          : sounds // ignore: cast_nullable_to_non_nullable
              as List<Sound>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListSoundCopyWith<$Res> implements $ListSoundCopyWith<$Res> {
  factory _$$_ListSoundCopyWith(
          _$_ListSound value, $Res Function(_$_ListSound) then) =
      __$$_ListSoundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Sound> sounds});
}

/// @nodoc
class __$$_ListSoundCopyWithImpl<$Res>
    extends _$ListSoundCopyWithImpl<$Res, _$_ListSound>
    implements _$$_ListSoundCopyWith<$Res> {
  __$$_ListSoundCopyWithImpl(
      _$_ListSound _value, $Res Function(_$_ListSound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sounds = null,
  }) {
    return _then(_$_ListSound(
      sounds: null == sounds
          ? _value._sounds
          : sounds // ignore: cast_nullable_to_non_nullable
              as List<Sound>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListSound implements _ListSound {
  const _$_ListSound({required final List<Sound> sounds}) : _sounds = sounds;

  factory _$_ListSound.fromJson(Map<String, dynamic> json) =>
      _$$_ListSoundFromJson(json);

  final List<Sound> _sounds;
  @override
  List<Sound> get sounds {
    if (_sounds is EqualUnmodifiableListView) return _sounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sounds);
  }

  @override
  String toString() {
    return 'ListSound(sounds: $sounds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListSound &&
            const DeepCollectionEquality().equals(other._sounds, _sounds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sounds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListSoundCopyWith<_$_ListSound> get copyWith =>
      __$$_ListSoundCopyWithImpl<_$_ListSound>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListSoundToJson(
      this,
    );
  }
}

abstract class _ListSound implements ListSound {
  const factory _ListSound({required final List<Sound> sounds}) = _$_ListSound;

  factory _ListSound.fromJson(Map<String, dynamic> json) =
      _$_ListSound.fromJson;

  @override
  List<Sound> get sounds;
  @override
  @JsonKey(ignore: true)
  _$$_ListSoundCopyWith<_$_ListSound> get copyWith =>
      throw _privateConstructorUsedError;
}
