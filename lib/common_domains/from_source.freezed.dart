// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'from_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FromSource _$FromSourceFromJson(Map<String, dynamic> json) {
  return _FromSource.fromJson(json);
}

/// @nodoc
mixin _$FromSource {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromSourceCopyWith<FromSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromSourceCopyWith<$Res> {
  factory $FromSourceCopyWith(
          FromSource value, $Res Function(FromSource) then) =
      _$FromSourceCopyWithImpl<$Res, FromSource>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      String name,
      String website});
}

/// @nodoc
class _$FromSourceCopyWithImpl<$Res, $Val extends FromSource>
    implements $FromSourceCopyWith<$Res> {
  _$FromSourceCopyWithImpl(this._value, this._then);

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
    Object? website = null,
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
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FromSourceImplCopyWith<$Res>
    implements $FromSourceCopyWith<$Res> {
  factory _$$FromSourceImplCopyWith(
          _$FromSourceImpl value, $Res Function(_$FromSourceImpl) then) =
      __$$FromSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      String name,
      String website});
}

/// @nodoc
class __$$FromSourceImplCopyWithImpl<$Res>
    extends _$FromSourceCopyWithImpl<$Res, _$FromSourceImpl>
    implements _$$FromSourceImplCopyWith<$Res> {
  __$$FromSourceImplCopyWithImpl(
      _$FromSourceImpl _value, $Res Function(_$FromSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? website = null,
  }) {
    return _then(_$FromSourceImpl(
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
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FromSourceImpl implements _FromSource {
  const _$FromSourceImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.name,
      required this.website});

  factory _$FromSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FromSourceImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String name;
  @override
  final String website;

  @override
  String toString() {
    return 'FromSource(id: $id, createdAt: $createdAt, name: $name, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, name, website);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FromSourceImplCopyWith<_$FromSourceImpl> get copyWith =>
      __$$FromSourceImplCopyWithImpl<_$FromSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FromSourceImplToJson(
      this,
    );
  }
}

abstract class _FromSource implements FromSource {
  const factory _FromSource(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      required final String name,
      required final String website}) = _$FromSourceImpl;

  factory _FromSource.fromJson(Map<String, dynamic> json) =
      _$FromSourceImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String get name;
  @override
  String get website;
  @override
  @JsonKey(ignore: true)
  _$$FromSourceImplCopyWith<_$FromSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
