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
abstract class _$$OfflineMixEditorStateImplCopyWith<$Res>
    implements $OfflineMixEditorStateCopyWith<$Res> {
  factory _$$OfflineMixEditorStateImplCopyWith(
          _$OfflineMixEditorStateImpl value,
          $Res Function(_$OfflineMixEditorStateImpl) then) =
      __$$OfflineMixEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OfflineMixEditorItemState> offlineMixEditorItemStates});
}

/// @nodoc
class __$$OfflineMixEditorStateImplCopyWithImpl<$Res>
    extends _$OfflineMixEditorStateCopyWithImpl<$Res,
        _$OfflineMixEditorStateImpl>
    implements _$$OfflineMixEditorStateImplCopyWith<$Res> {
  __$$OfflineMixEditorStateImplCopyWithImpl(_$OfflineMixEditorStateImpl _value,
      $Res Function(_$OfflineMixEditorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offlineMixEditorItemStates = null,
  }) {
    return _then(_$OfflineMixEditorStateImpl(
      offlineMixEditorItemStates: null == offlineMixEditorItemStates
          ? _value._offlineMixEditorItemStates
          : offlineMixEditorItemStates // ignore: cast_nullable_to_non_nullable
              as List<OfflineMixEditorItemState>,
    ));
  }
}

/// @nodoc

class _$OfflineMixEditorStateImpl implements _OfflineMixEditorState {
  const _$OfflineMixEditorStateImpl(
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
            other is _$OfflineMixEditorStateImpl &&
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
  _$$OfflineMixEditorStateImplCopyWith<_$OfflineMixEditorStateImpl>
      get copyWith => __$$OfflineMixEditorStateImplCopyWithImpl<
          _$OfflineMixEditorStateImpl>(this, _$identity);
}

abstract class _OfflineMixEditorState implements OfflineMixEditorState {
  const factory _OfflineMixEditorState(
      {required final List<OfflineMixEditorItemState>
          offlineMixEditorItemStates}) = _$OfflineMixEditorStateImpl;

  @override
  List<OfflineMixEditorItemState> get offlineMixEditorItemStates;
  @override
  @JsonKey(ignore: true)
  _$$OfflineMixEditorStateImplCopyWith<_$OfflineMixEditorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
