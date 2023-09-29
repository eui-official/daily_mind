// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_mix_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OfflineMixEditorState {
  List<OfflineMixEditorItemState> get offlineMixEditorItemStates =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OfflineMixEditorStateCopyWith<OfflineMixEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineMixEditorStateCopyWith<$Res> {
  factory $OfflineMixEditorStateCopyWith(OfflineMixEditorState value,
          $Res Function(OfflineMixEditorState) then) =
      _$OfflineMixEditorStateCopyWithImpl<$Res, OfflineMixEditorState>;
  @useResult
  $Res call({List<OfflineMixEditorItemState> offlineMixEditorItemStates});
}

/// @nodoc
class _$OfflineMixEditorStateCopyWithImpl<$Res,
        $Val extends OfflineMixEditorState>
    implements $OfflineMixEditorStateCopyWith<$Res> {
  _$OfflineMixEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offlineMixEditorItemStates = null,
  }) {
    return _then(_value.copyWith(
      offlineMixEditorItemStates: null == offlineMixEditorItemStates
          ? _value.offlineMixEditorItemStates
          : offlineMixEditorItemStates // ignore: cast_nullable_to_non_nullable
              as List<OfflineMixEditorItemState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfflineMixEditorStateCopyWith<$Res>
    implements $OfflineMixEditorStateCopyWith<$Res> {
  factory _$$_OfflineMixEditorStateCopyWith(_$_OfflineMixEditorState value,
          $Res Function(_$_OfflineMixEditorState) then) =
      __$$_OfflineMixEditorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OfflineMixEditorItemState> offlineMixEditorItemStates});
}

/// @nodoc
class __$$_OfflineMixEditorStateCopyWithImpl<$Res>
    extends _$OfflineMixEditorStateCopyWithImpl<$Res, _$_OfflineMixEditorState>
    implements _$$_OfflineMixEditorStateCopyWith<$Res> {
  __$$_OfflineMixEditorStateCopyWithImpl(_$_OfflineMixEditorState _value,
      $Res Function(_$_OfflineMixEditorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offlineMixEditorItemStates = null,
  }) {
    return _then(_$_OfflineMixEditorState(
      offlineMixEditorItemStates: null == offlineMixEditorItemStates
          ? _value._offlineMixEditorItemStates
          : offlineMixEditorItemStates // ignore: cast_nullable_to_non_nullable
              as List<OfflineMixEditorItemState>,
    ));
  }
}

/// @nodoc

class _$_OfflineMixEditorState implements _OfflineMixEditorState {
  const _$_OfflineMixEditorState(
      {required final List<OfflineMixEditorItemState>
          offlineMixEditorItemStates})
      : _offlineMixEditorItemStates = offlineMixEditorItemStates;

  final List<OfflineMixEditorItemState> _offlineMixEditorItemStates;
  @override
  List<OfflineMixEditorItemState> get offlineMixEditorItemStates {
    if (_offlineMixEditorItemStates is EqualUnmodifiableListView)
      return _offlineMixEditorItemStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offlineMixEditorItemStates);
  }

  @override
  String toString() {
    return 'OfflineMixEditorState(offlineMixEditorItemStates: $offlineMixEditorItemStates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfflineMixEditorState &&
            const DeepCollectionEquality().equals(
                other._offlineMixEditorItemStates,
                _offlineMixEditorItemStates));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_offlineMixEditorItemStates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfflineMixEditorStateCopyWith<_$_OfflineMixEditorState> get copyWith =>
      __$$_OfflineMixEditorStateCopyWithImpl<_$_OfflineMixEditorState>(
          this, _$identity);
}

abstract class _OfflineMixEditorState implements OfflineMixEditorState {
  const factory _OfflineMixEditorState(
      {required final List<OfflineMixEditorItemState>
          offlineMixEditorItemStates}) = _$_OfflineMixEditorState;

  @override
  List<OfflineMixEditorItemState> get offlineMixEditorItemStates;
  @override
  @JsonKey(ignore: true)
  _$$_OfflineMixEditorStateCopyWith<_$_OfflineMixEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}
