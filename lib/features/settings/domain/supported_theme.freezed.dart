// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supported_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SupportedTheme {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  FlexScheme get scheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupportedThemeCopyWith<SupportedTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportedThemeCopyWith<$Res> {
  factory $SupportedThemeCopyWith(
          SupportedTheme value, $Res Function(SupportedTheme) then) =
      _$SupportedThemeCopyWithImpl<$Res, SupportedTheme>;
  @useResult
  $Res call({String id, String title, FlexScheme scheme});
}

/// @nodoc
class _$SupportedThemeCopyWithImpl<$Res, $Val extends SupportedTheme>
    implements $SupportedThemeCopyWith<$Res> {
  _$SupportedThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? scheme = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      scheme: null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as FlexScheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportedThemeImplCopyWith<$Res>
    implements $SupportedThemeCopyWith<$Res> {
  factory _$$SupportedThemeImplCopyWith(_$SupportedThemeImpl value,
          $Res Function(_$SupportedThemeImpl) then) =
      __$$SupportedThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, FlexScheme scheme});
}

/// @nodoc
class __$$SupportedThemeImplCopyWithImpl<$Res>
    extends _$SupportedThemeCopyWithImpl<$Res, _$SupportedThemeImpl>
    implements _$$SupportedThemeImplCopyWith<$Res> {
  __$$SupportedThemeImplCopyWithImpl(
      _$SupportedThemeImpl _value, $Res Function(_$SupportedThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? scheme = null,
  }) {
    return _then(_$SupportedThemeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      scheme: null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as FlexScheme,
    ));
  }
}

/// @nodoc

class _$SupportedThemeImpl implements _SupportedTheme {
  const _$SupportedThemeImpl(
      {required this.id, required this.title, required this.scheme});

  @override
  final String id;
  @override
  final String title;
  @override
  final FlexScheme scheme;

  @override
  String toString() {
    return 'SupportedTheme(id: $id, title: $title, scheme: $scheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportedThemeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.scheme, scheme) || other.scheme == scheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, scheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportedThemeImplCopyWith<_$SupportedThemeImpl> get copyWith =>
      __$$SupportedThemeImplCopyWithImpl<_$SupportedThemeImpl>(
          this, _$identity);
}

abstract class _SupportedTheme implements SupportedTheme {
  const factory _SupportedTheme(
      {required final String id,
      required final String title,
      required final FlexScheme scheme}) = _$SupportedThemeImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  FlexScheme get scheme;
  @override
  @JsonKey(ignore: true)
  _$$SupportedThemeImplCopyWith<_$SupportedThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
