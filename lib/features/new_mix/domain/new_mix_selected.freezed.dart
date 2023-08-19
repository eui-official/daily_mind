// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_mix_selected.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewMixSelected {
  List<String> get ids => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewMixSelectedCopyWith<NewMixSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewMixSelectedCopyWith<$Res> {
  factory $NewMixSelectedCopyWith(
          NewMixSelected value, $Res Function(NewMixSelected) then) =
      _$NewMixSelectedCopyWithImpl<$Res, NewMixSelected>;
  @useResult
  $Res call({List<String> ids});
}

/// @nodoc
class _$NewMixSelectedCopyWithImpl<$Res, $Val extends NewMixSelected>
    implements $NewMixSelectedCopyWith<$Res> {
  _$NewMixSelectedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_value.copyWith(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewMixSelectedCopyWith<$Res>
    implements $NewMixSelectedCopyWith<$Res> {
  factory _$$_NewMixSelectedCopyWith(
          _$_NewMixSelected value, $Res Function(_$_NewMixSelected) then) =
      __$$_NewMixSelectedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> ids});
}

/// @nodoc
class __$$_NewMixSelectedCopyWithImpl<$Res>
    extends _$NewMixSelectedCopyWithImpl<$Res, _$_NewMixSelected>
    implements _$$_NewMixSelectedCopyWith<$Res> {
  __$$_NewMixSelectedCopyWithImpl(
      _$_NewMixSelected _value, $Res Function(_$_NewMixSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_$_NewMixSelected(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_NewMixSelected implements _NewMixSelected {
  const _$_NewMixSelected({required final List<String> ids}) : _ids = ids;

  final List<String> _ids;
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'NewMixSelected(ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewMixSelected &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewMixSelectedCopyWith<_$_NewMixSelected> get copyWith =>
      __$$_NewMixSelectedCopyWithImpl<_$_NewMixSelected>(this, _$identity);
}

abstract class _NewMixSelected implements NewMixSelected {
  const factory _NewMixSelected({required final List<String> ids}) =
      _$_NewMixSelected;

  @override
  List<String> get ids;
  @override
  @JsonKey(ignore: true)
  _$$_NewMixSelectedCopyWith<_$_NewMixSelected> get copyWith =>
      throw _privateConstructorUsedError;
}
