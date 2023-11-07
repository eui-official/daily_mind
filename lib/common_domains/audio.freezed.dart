// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return _Audio.fromJson(json);
}

/// @nodoc
mixin _$Audio {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioCopyWith<Audio> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioCopyWith<$Res> {
  factory $AudioCopyWith(Audio value, $Res Function(Audio) then) =
      _$AudioCopyWithImpl<$Res, Audio>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      String name,
      String image,
      String source,
      String category});
}

/// @nodoc
class _$AudioCopyWithImpl<$Res, $Val extends Audio>
    implements $AudioCopyWith<$Res> {
  _$AudioCopyWithImpl(this._value, this._then);

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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioImplCopyWith<$Res> implements $AudioCopyWith<$Res> {
  factory _$$AudioImplCopyWith(
          _$AudioImpl value, $Res Function(_$AudioImpl) then) =
      __$$AudioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      String name,
      String image,
      String source,
      String category});
}

/// @nodoc
class __$$AudioImplCopyWithImpl<$Res>
    extends _$AudioCopyWithImpl<$Res, _$AudioImpl>
    implements _$$AudioImplCopyWith<$Res> {
  __$$AudioImplCopyWithImpl(
      _$AudioImpl _value, $Res Function(_$AudioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? image = null,
    Object? source = null,
    Object? category = null,
  }) {
    return _then(_$AudioImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioImpl implements _Audio {
  const _$AudioImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.name,
      required this.image,
      required this.source,
      required this.category});

  factory _$AudioImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioImplFromJson(json);

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
  final String category;

  @override
  String toString() {
    return 'Audio(id: $id, createdAt: $createdAt, name: $name, image: $image, source: $source, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, name, image, source, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      __$$AudioImplCopyWithImpl<_$AudioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioImplToJson(
      this,
    );
  }
}

abstract class _Audio implements Audio {
  const factory _Audio(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      required final String name,
      required final String image,
      required final String source,
      required final String category}) = _$AudioImpl;

  factory _Audio.fromJson(Map<String, dynamic> json) = _$AudioImpl.fromJson;

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
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
