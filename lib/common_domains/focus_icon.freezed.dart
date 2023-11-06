// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FocusIcon {
  String get icon => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusIconCopyWith<FocusIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusIconCopyWith<$Res> {
  factory $FocusIconCopyWith(FocusIcon value, $Res Function(FocusIcon) then) =
      _$FocusIconCopyWithImpl<$Res, FocusIcon>;
  @useResult
  $Res call({String icon, String id});
}

/// @nodoc
class _$FocusIconCopyWithImpl<$Res, $Val extends FocusIcon>
    implements $FocusIconCopyWith<$Res> {
  _$FocusIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FocusIconImplCopyWith<$Res>
    implements $FocusIconCopyWith<$Res> {
  factory _$$FocusIconImplCopyWith(
          _$FocusIconImpl value, $Res Function(_$FocusIconImpl) then) =
      __$$FocusIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String icon, String id});
}

/// @nodoc
class __$$FocusIconImplCopyWithImpl<$Res>
    extends _$FocusIconCopyWithImpl<$Res, _$FocusIconImpl>
    implements _$$FocusIconImplCopyWith<$Res> {
  __$$FocusIconImplCopyWithImpl(
      _$FocusIconImpl _value, $Res Function(_$FocusIconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? id = null,
  }) {
    return _then(_$FocusIconImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FocusIconImpl implements _FocusIcon {
  const _$FocusIconImpl({required this.icon, required this.id});

  @override
  final String icon;
  @override
  final String id;

  @override
  String toString() {
    return 'FocusIcon(icon: $icon, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusIconImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusIconImplCopyWith<_$FocusIconImpl> get copyWith =>
      __$$FocusIconImplCopyWithImpl<_$FocusIconImpl>(this, _$identity);
}

abstract class _FocusIcon implements FocusIcon {
  const factory _FocusIcon(
      {required final String icon, required final String id}) = _$FocusIconImpl;

  @override
  String get icon;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$FocusIconImplCopyWith<_$FocusIconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
