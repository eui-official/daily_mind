// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_sound_online_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListSoundOnlineItems _$ListSoundOnlineItemsFromJson(Map<String, dynamic> json) {
  return _ListSoundOnlineItems.fromJson(json);
}

/// @nodoc
mixin _$ListSoundOnlineItems {
  List<SoundOnlineItem> get soundOnlineItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListSoundOnlineItemsCopyWith<ListSoundOnlineItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSoundOnlineItemsCopyWith<$Res> {
  factory $ListSoundOnlineItemsCopyWith(ListSoundOnlineItems value,
          $Res Function(ListSoundOnlineItems) then) =
      _$ListSoundOnlineItemsCopyWithImpl<$Res, ListSoundOnlineItems>;
  @useResult
  $Res call({List<SoundOnlineItem> soundOnlineItems});
}

/// @nodoc
class _$ListSoundOnlineItemsCopyWithImpl<$Res,
        $Val extends ListSoundOnlineItems>
    implements $ListSoundOnlineItemsCopyWith<$Res> {
  _$ListSoundOnlineItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundOnlineItems = null,
  }) {
    return _then(_value.copyWith(
      soundOnlineItems: null == soundOnlineItems
          ? _value.soundOnlineItems
          : soundOnlineItems // ignore: cast_nullable_to_non_nullable
              as List<SoundOnlineItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListSoundOnlineItemsCopyWith<$Res>
    implements $ListSoundOnlineItemsCopyWith<$Res> {
  factory _$$_ListSoundOnlineItemsCopyWith(_$_ListSoundOnlineItems value,
          $Res Function(_$_ListSoundOnlineItems) then) =
      __$$_ListSoundOnlineItemsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SoundOnlineItem> soundOnlineItems});
}

/// @nodoc
class __$$_ListSoundOnlineItemsCopyWithImpl<$Res>
    extends _$ListSoundOnlineItemsCopyWithImpl<$Res, _$_ListSoundOnlineItems>
    implements _$$_ListSoundOnlineItemsCopyWith<$Res> {
  __$$_ListSoundOnlineItemsCopyWithImpl(_$_ListSoundOnlineItems _value,
      $Res Function(_$_ListSoundOnlineItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundOnlineItems = null,
  }) {
    return _then(_$_ListSoundOnlineItems(
      soundOnlineItems: null == soundOnlineItems
          ? _value._soundOnlineItems
          : soundOnlineItems // ignore: cast_nullable_to_non_nullable
              as List<SoundOnlineItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListSoundOnlineItems implements _ListSoundOnlineItems {
  const _$_ListSoundOnlineItems(
      {required final List<SoundOnlineItem> soundOnlineItems})
      : _soundOnlineItems = soundOnlineItems;

  factory _$_ListSoundOnlineItems.fromJson(Map<String, dynamic> json) =>
      _$$_ListSoundOnlineItemsFromJson(json);

  final List<SoundOnlineItem> _soundOnlineItems;
  @override
  List<SoundOnlineItem> get soundOnlineItems {
    if (_soundOnlineItems is EqualUnmodifiableListView)
      return _soundOnlineItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soundOnlineItems);
  }

  @override
  String toString() {
    return 'ListSoundOnlineItems(soundOnlineItems: $soundOnlineItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListSoundOnlineItems &&
            const DeepCollectionEquality()
                .equals(other._soundOnlineItems, _soundOnlineItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_soundOnlineItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListSoundOnlineItemsCopyWith<_$_ListSoundOnlineItems> get copyWith =>
      __$$_ListSoundOnlineItemsCopyWithImpl<_$_ListSoundOnlineItems>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListSoundOnlineItemsToJson(
      this,
    );
  }
}

abstract class _ListSoundOnlineItems implements ListSoundOnlineItems {
  const factory _ListSoundOnlineItems(
          {required final List<SoundOnlineItem> soundOnlineItems}) =
      _$_ListSoundOnlineItems;

  factory _ListSoundOnlineItems.fromJson(Map<String, dynamic> json) =
      _$_ListSoundOnlineItems.fromJson;

  @override
  List<SoundOnlineItem> get soundOnlineItems;
  @override
  @JsonKey(ignore: true)
  _$$_ListSoundOnlineItemsCopyWith<_$_ListSoundOnlineItems> get copyWith =>
      throw _privateConstructorUsedError;
}
