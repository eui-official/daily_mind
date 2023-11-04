// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_mix_editor_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OfflineMixEditorItemState {
  String get id => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OfflineMixEditorItemStateCopyWith<OfflineMixEditorItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineMixEditorItemStateCopyWith<$Res> {
  factory $OfflineMixEditorItemStateCopyWith(OfflineMixEditorItemState value,
          $Res Function(OfflineMixEditorItemState) then) =
      _$OfflineMixEditorItemStateCopyWithImpl<$Res, OfflineMixEditorItemState>;
  @useResult
  $Res call({String id, double volume});
}

/// @nodoc
class _$OfflineMixEditorItemStateCopyWithImpl<$Res,
        $Val extends OfflineMixEditorItemState>
    implements $OfflineMixEditorItemStateCopyWith<$Res> {
  _$OfflineMixEditorItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfflineMixEditorItemStateImplCopyWith<$Res>
    implements $OfflineMixEditorItemStateCopyWith<$Res> {
  factory _$$OfflineMixEditorItemStateImplCopyWith(
          _$OfflineMixEditorItemStateImpl value,
          $Res Function(_$OfflineMixEditorItemStateImpl) then) =
      __$$OfflineMixEditorItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double volume});
}

/// @nodoc
class __$$OfflineMixEditorItemStateImplCopyWithImpl<$Res>
    extends _$OfflineMixEditorItemStateCopyWithImpl<$Res,
        _$OfflineMixEditorItemStateImpl>
    implements _$$OfflineMixEditorItemStateImplCopyWith<$Res> {
  __$$OfflineMixEditorItemStateImplCopyWithImpl(
      _$OfflineMixEditorItemStateImpl _value,
      $Res Function(_$OfflineMixEditorItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
  }) {
    return _then(_$OfflineMixEditorItemStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OfflineMixEditorItemStateImpl implements _OfflineMixEditorItemState {
  const _$OfflineMixEditorItemStateImpl(
      {required this.id, required this.volume});

  @override
  final String id;
  @override
  final double volume;

  @override
  String toString() {
    return 'OfflineMixEditorItemState(id: $id, volume: $volume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineMixEditorItemStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineMixEditorItemStateImplCopyWith<_$OfflineMixEditorItemStateImpl>
      get copyWith => __$$OfflineMixEditorItemStateImplCopyWithImpl<
          _$OfflineMixEditorItemStateImpl>(this, _$identity);
}

abstract class _OfflineMixEditorItemState implements OfflineMixEditorItemState {
  const factory _OfflineMixEditorItemState(
      {required final String id,
      required final double volume}) = _$OfflineMixEditorItemStateImpl;

  @override
  String get id;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$OfflineMixEditorItemStateImplCopyWith<_$OfflineMixEditorItemStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
