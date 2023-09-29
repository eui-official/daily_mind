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
abstract class _$$_OfflineMixEditorItemStateCopyWith<$Res>
    implements $OfflineMixEditorItemStateCopyWith<$Res> {
  factory _$$_OfflineMixEditorItemStateCopyWith(
          _$_OfflineMixEditorItemState value,
          $Res Function(_$_OfflineMixEditorItemState) then) =
      __$$_OfflineMixEditorItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double volume});
}

/// @nodoc
class __$$_OfflineMixEditorItemStateCopyWithImpl<$Res>
    extends _$OfflineMixEditorItemStateCopyWithImpl<$Res,
        _$_OfflineMixEditorItemState>
    implements _$$_OfflineMixEditorItemStateCopyWith<$Res> {
  __$$_OfflineMixEditorItemStateCopyWithImpl(
      _$_OfflineMixEditorItemState _value,
      $Res Function(_$_OfflineMixEditorItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
  }) {
    return _then(_$_OfflineMixEditorItemState(
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

class _$_OfflineMixEditorItemState implements _OfflineMixEditorItemState {
  const _$_OfflineMixEditorItemState({required this.id, required this.volume});

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
            other is _$_OfflineMixEditorItemState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfflineMixEditorItemStateCopyWith<_$_OfflineMixEditorItemState>
      get copyWith => __$$_OfflineMixEditorItemStateCopyWithImpl<
          _$_OfflineMixEditorItemState>(this, _$identity);
}

abstract class _OfflineMixEditorItemState implements OfflineMixEditorItemState {
  const factory _OfflineMixEditorItemState(
      {required final String id,
      required final double volume}) = _$_OfflineMixEditorItemState;

  @override
  String get id;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$_OfflineMixEditorItemStateCopyWith<_$_OfflineMixEditorItemState>
      get copyWith => throw _privateConstructorUsedError;
}
