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
  String get selectingId => throw _privateConstructorUsedError;
  List<String> get selectedIds => throw _privateConstructorUsedError;

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
  $Res call({String selectingId, List<String> selectedIds});
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
    Object? selectingId = null,
    Object? selectedIds = null,
  }) {
    return _then(_value.copyWith(
      selectingId: null == selectingId
          ? _value.selectingId
          : selectingId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIds: null == selectedIds
          ? _value.selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
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
  $Res call({String selectingId, List<String> selectedIds});
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
    Object? selectingId = null,
    Object? selectedIds = null,
  }) {
    return _then(_$_NewMixSelected(
      selectingId: null == selectingId
          ? _value.selectingId
          : selectingId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIds: null == selectedIds
          ? _value._selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_NewMixSelected extends _NewMixSelected {
  const _$_NewMixSelected(
      {required this.selectingId, required final List<String> selectedIds})
      : _selectedIds = selectedIds,
        super._();

  @override
  final String selectingId;
  final List<String> _selectedIds;
  @override
  List<String> get selectedIds {
    if (_selectedIds is EqualUnmodifiableListView) return _selectedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIds);
  }

  @override
  String toString() {
    return 'NewMixSelected(selectingId: $selectingId, selectedIds: $selectedIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewMixSelected &&
            (identical(other.selectingId, selectingId) ||
                other.selectingId == selectingId) &&
            const DeepCollectionEquality()
                .equals(other._selectedIds, _selectedIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectingId,
      const DeepCollectionEquality().hash(_selectedIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewMixSelectedCopyWith<_$_NewMixSelected> get copyWith =>
      __$$_NewMixSelectedCopyWithImpl<_$_NewMixSelected>(this, _$identity);
}

abstract class _NewMixSelected extends NewMixSelected {
  const factory _NewMixSelected(
      {required final String selectingId,
      required final List<String> selectedIds}) = _$_NewMixSelected;
  const _NewMixSelected._() : super._();

  @override
  String get selectingId;
  @override
  List<String> get selectedIds;
  @override
  @JsonKey(ignore: true)
  _$$_NewMixSelectedCopyWith<_$_NewMixSelected> get copyWith =>
      throw _privateConstructorUsedError;
}
