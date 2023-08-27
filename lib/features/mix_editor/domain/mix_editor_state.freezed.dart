// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mix_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MixEditorState {
  List<MixEditorItemState> get itemStates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MixEditorStateCopyWith<MixEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixEditorStateCopyWith<$Res> {
  factory $MixEditorStateCopyWith(
          MixEditorState value, $Res Function(MixEditorState) then) =
      _$MixEditorStateCopyWithImpl<$Res, MixEditorState>;
  @useResult
  $Res call({List<MixEditorItemState> itemStates});
}

/// @nodoc
class _$MixEditorStateCopyWithImpl<$Res, $Val extends MixEditorState>
    implements $MixEditorStateCopyWith<$Res> {
  _$MixEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemStates = null,
  }) {
    return _then(_value.copyWith(
      itemStates: null == itemStates
          ? _value.itemStates
          : itemStates // ignore: cast_nullable_to_non_nullable
              as List<MixEditorItemState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MixEditorStateCopyWith<$Res>
    implements $MixEditorStateCopyWith<$Res> {
  factory _$$_MixEditorStateCopyWith(
          _$_MixEditorState value, $Res Function(_$_MixEditorState) then) =
      __$$_MixEditorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MixEditorItemState> itemStates});
}

/// @nodoc
class __$$_MixEditorStateCopyWithImpl<$Res>
    extends _$MixEditorStateCopyWithImpl<$Res, _$_MixEditorState>
    implements _$$_MixEditorStateCopyWith<$Res> {
  __$$_MixEditorStateCopyWithImpl(
      _$_MixEditorState _value, $Res Function(_$_MixEditorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemStates = null,
  }) {
    return _then(_$_MixEditorState(
      itemStates: null == itemStates
          ? _value._itemStates
          : itemStates // ignore: cast_nullable_to_non_nullable
              as List<MixEditorItemState>,
    ));
  }
}

/// @nodoc

class _$_MixEditorState implements _MixEditorState {
  const _$_MixEditorState({required final List<MixEditorItemState> itemStates})
      : _itemStates = itemStates;

  final List<MixEditorItemState> _itemStates;
  @override
  List<MixEditorItemState> get itemStates {
    if (_itemStates is EqualUnmodifiableListView) return _itemStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemStates);
  }

  @override
  String toString() {
    return 'MixEditorState(itemStates: $itemStates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MixEditorState &&
            const DeepCollectionEquality()
                .equals(other._itemStates, _itemStates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_itemStates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MixEditorStateCopyWith<_$_MixEditorState> get copyWith =>
      __$$_MixEditorStateCopyWithImpl<_$_MixEditorState>(this, _$identity);
}

abstract class _MixEditorState implements MixEditorState {
  const factory _MixEditorState(
      {required final List<MixEditorItemState> itemStates}) = _$_MixEditorState;

  @override
  List<MixEditorItemState> get itemStates;
  @override
  @JsonKey(ignore: true)
  _$$_MixEditorStateCopyWith<_$_MixEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}
