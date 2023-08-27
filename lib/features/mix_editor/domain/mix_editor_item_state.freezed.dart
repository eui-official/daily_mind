// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mix_editor_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MixEditorItemState {
  String get id => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MixEditorItemStateCopyWith<MixEditorItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixEditorItemStateCopyWith<$Res> {
  factory $MixEditorItemStateCopyWith(
          MixEditorItemState value, $Res Function(MixEditorItemState) then) =
      _$MixEditorItemStateCopyWithImpl<$Res, MixEditorItemState>;
  @useResult
  $Res call({String id, double volume});
}

/// @nodoc
class _$MixEditorItemStateCopyWithImpl<$Res, $Val extends MixEditorItemState>
    implements $MixEditorItemStateCopyWith<$Res> {
  _$MixEditorItemStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_MixEditorItemStateCopyWith<$Res>
    implements $MixEditorItemStateCopyWith<$Res> {
  factory _$$_MixEditorItemStateCopyWith(_$_MixEditorItemState value,
          $Res Function(_$_MixEditorItemState) then) =
      __$$_MixEditorItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double volume});
}

/// @nodoc
class __$$_MixEditorItemStateCopyWithImpl<$Res>
    extends _$MixEditorItemStateCopyWithImpl<$Res, _$_MixEditorItemState>
    implements _$$_MixEditorItemStateCopyWith<$Res> {
  __$$_MixEditorItemStateCopyWithImpl(
      _$_MixEditorItemState _value, $Res Function(_$_MixEditorItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volume = null,
  }) {
    return _then(_$_MixEditorItemState(
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

class _$_MixEditorItemState implements _MixEditorItemState {
  const _$_MixEditorItemState({required this.id, required this.volume});

  @override
  final String id;
  @override
  final double volume;

  @override
  String toString() {
    return 'MixEditorItemState(id: $id, volume: $volume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MixEditorItemState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MixEditorItemStateCopyWith<_$_MixEditorItemState> get copyWith =>
      __$$_MixEditorItemStateCopyWithImpl<_$_MixEditorItemState>(
          this, _$identity);
}

abstract class _MixEditorItemState implements MixEditorItemState {
  const factory _MixEditorItemState(
      {required final String id,
      required final double volume}) = _$_MixEditorItemState;

  @override
  String get id;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$_MixEditorItemStateCopyWith<_$_MixEditorItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
