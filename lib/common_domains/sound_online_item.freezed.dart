// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sound_online_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SoundOnlineItem _$SoundOnlineItemFromJson(Map<String, dynamic> json) {
  return _SoundOnlineItem.fromJson(json);
}

/// @nodoc
mixin _$SoundOnlineItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'sound_type')
  String get soundType => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoundOnlineItemCopyWith<SoundOnlineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoundOnlineItemCopyWith<$Res> {
  factory $SoundOnlineItemCopyWith(
          SoundOnlineItem value, $Res Function(SoundOnlineItem) then) =
      _$SoundOnlineItemCopyWithImpl<$Res, SoundOnlineItem>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      String name,
      String image,
      String source,
      @JsonKey(name: 'sound_type') String soundType,
      String category});
}

/// @nodoc
class _$SoundOnlineItemCopyWithImpl<$Res, $Val extends SoundOnlineItem>
    implements $SoundOnlineItemCopyWith<$Res> {
  _$SoundOnlineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? image = null,
    Object? source = null,
    Object? soundType = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SoundOnlineItemCopyWith<$Res>
    implements $SoundOnlineItemCopyWith<$Res> {
  factory _$$_SoundOnlineItemCopyWith(
          _$_SoundOnlineItem value, $Res Function(_$_SoundOnlineItem) then) =
      __$$_SoundOnlineItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      String name,
      String image,
      String source,
      @JsonKey(name: 'sound_type') String soundType,
      String category});
}

/// @nodoc
class __$$_SoundOnlineItemCopyWithImpl<$Res>
    extends _$SoundOnlineItemCopyWithImpl<$Res, _$_SoundOnlineItem>
    implements _$$_SoundOnlineItemCopyWith<$Res> {
  __$$_SoundOnlineItemCopyWithImpl(
      _$_SoundOnlineItem _value, $Res Function(_$_SoundOnlineItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? image = null,
    Object? source = null,
    Object? soundType = null,
    Object? category = null,
  }) {
    return _then(_$_SoundOnlineItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SoundOnlineItem implements _SoundOnlineItem {
  const _$_SoundOnlineItem(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.name,
      required this.image,
      required this.source,
      @JsonKey(name: 'sound_type') required this.soundType,
      required this.category});

  factory _$_SoundOnlineItem.fromJson(Map<String, dynamic> json) =>
      _$$_SoundOnlineItemFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String name;
  @override
  final String image;
  @override
  final String source;
  @override
  @JsonKey(name: 'sound_type')
  final String soundType;
  @override
  final String category;

  @override
  String toString() {
    return 'SoundOnlineItem(id: $id, createdAt: $createdAt, name: $name, image: $image, source: $source, soundType: $soundType, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SoundOnlineItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.soundType, soundType) ||
                other.soundType == soundType) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, name, image, source, soundType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SoundOnlineItemCopyWith<_$_SoundOnlineItem> get copyWith =>
      __$$_SoundOnlineItemCopyWithImpl<_$_SoundOnlineItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SoundOnlineItemToJson(
      this,
    );
  }
}

abstract class _SoundOnlineItem implements SoundOnlineItem {
  const factory _SoundOnlineItem(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      required final String name,
      required final String image,
      required final String source,
      @JsonKey(name: 'sound_type') required final String soundType,
      required final String category}) = _$_SoundOnlineItem;

  factory _SoundOnlineItem.fromJson(Map<String, dynamic> json) =
      _$_SoundOnlineItem.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String get name;
  @override
  String get image;
  @override
  String get source;
  @override
  @JsonKey(name: 'sound_type')
  String get soundType;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_SoundOnlineItemCopyWith<_$_SoundOnlineItem> get copyWith =>
      throw _privateConstructorUsedError;
}
