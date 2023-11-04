// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sound_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SoundType _$SoundTypeFromJson(Map<String, dynamic> json) {
  return _SoundType.fromJson(json);
}

/// @nodoc
mixin _$SoundType {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoundTypeCopyWith<SoundType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoundTypeCopyWith<$Res> {
  factory $SoundTypeCopyWith(SoundType value, $Res Function(SoundType) then) =
      _$SoundTypeCopyWithImpl<$Res, SoundType>;
  @useResult
  $Res call(
      {String id, @JsonKey(name: 'created_at') String createdAt, String name});
}

/// @nodoc
class _$SoundTypeCopyWithImpl<$Res, $Val extends SoundType>
    implements $SoundTypeCopyWith<$Res> {
  _$SoundTypeCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoundTypeImplCopyWith<$Res>
    implements $SoundTypeCopyWith<$Res> {
  factory _$$SoundTypeImplCopyWith(
          _$SoundTypeImpl value, $Res Function(_$SoundTypeImpl) then) =
      __$$SoundTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, @JsonKey(name: 'created_at') String createdAt, String name});
}

/// @nodoc
class __$$SoundTypeImplCopyWithImpl<$Res>
    extends _$SoundTypeCopyWithImpl<$Res, _$SoundTypeImpl>
    implements _$$SoundTypeImplCopyWith<$Res> {
  __$$SoundTypeImplCopyWithImpl(
      _$SoundTypeImpl _value, $Res Function(_$SoundTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
  }) {
    return _then(_$SoundTypeImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoundTypeImpl implements _SoundType {
  const _$SoundTypeImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.name});

  factory _$SoundTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoundTypeImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String name;

  @override
  String toString() {
    return 'SoundType(id: $id, createdAt: $createdAt, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoundTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoundTypeImplCopyWith<_$SoundTypeImpl> get copyWith =>
      __$$SoundTypeImplCopyWithImpl<_$SoundTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoundTypeImplToJson(
      this,
    );
  }
}

abstract class _SoundType implements SoundType {
  const factory _SoundType(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      required final String name}) = _$SoundTypeImpl;

  factory _SoundType.fromJson(Map<String, dynamic> json) =
      _$SoundTypeImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SoundTypeImplCopyWith<_$SoundTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
