// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_mix_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewMixState {
  SelectingState get selectingState => throw _privateConstructorUsedError;
  List<SelectingState> get selectedStates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewMixStateCopyWith<NewMixState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewMixStateCopyWith<$Res> {
  factory $NewMixStateCopyWith(
          NewMixState value, $Res Function(NewMixState) then) =
      _$NewMixStateCopyWithImpl<$Res, NewMixState>;
  @useResult
  $Res call(
      {SelectingState selectingState, List<SelectingState> selectedStates});

  $SelectingStateCopyWith<$Res> get selectingState;
}

/// @nodoc
class _$NewMixStateCopyWithImpl<$Res, $Val extends NewMixState>
    implements $NewMixStateCopyWith<$Res> {
  _$NewMixStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectingState = null,
    Object? selectedStates = null,
  }) {
    return _then(_value.copyWith(
      selectingState: null == selectingState
          ? _value.selectingState
          : selectingState // ignore: cast_nullable_to_non_nullable
              as SelectingState,
      selectedStates: null == selectedStates
          ? _value.selectedStates
          : selectedStates // ignore: cast_nullable_to_non_nullable
              as List<SelectingState>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectingStateCopyWith<$Res> get selectingState {
    return $SelectingStateCopyWith<$Res>(_value.selectingState, (value) {
      return _then(_value.copyWith(selectingState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewMixStateImplCopyWith<$Res>
    implements $NewMixStateCopyWith<$Res> {
  factory _$$NewMixStateImplCopyWith(
          _$NewMixStateImpl value, $Res Function(_$NewMixStateImpl) then) =
      __$$NewMixStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SelectingState selectingState, List<SelectingState> selectedStates});

  @override
  $SelectingStateCopyWith<$Res> get selectingState;
}

/// @nodoc
class __$$NewMixStateImplCopyWithImpl<$Res>
    extends _$NewMixStateCopyWithImpl<$Res, _$NewMixStateImpl>
    implements _$$NewMixStateImplCopyWith<$Res> {
  __$$NewMixStateImplCopyWithImpl(
      _$NewMixStateImpl _value, $Res Function(_$NewMixStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectingState = null,
    Object? selectedStates = null,
  }) {
    return _then(_$NewMixStateImpl(
      selectingState: null == selectingState
          ? _value.selectingState
          : selectingState // ignore: cast_nullable_to_non_nullable
              as SelectingState,
      selectedStates: null == selectedStates
          ? _value._selectedStates
          : selectedStates // ignore: cast_nullable_to_non_nullable
              as List<SelectingState>,
    ));
  }
}

/// @nodoc

class _$NewMixStateImpl extends _NewMixState {
  const _$NewMixStateImpl(
      {required this.selectingState,
      required final List<SelectingState> selectedStates})
      : _selectedStates = selectedStates,
        super._();

  @override
  final SelectingState selectingState;
  final List<SelectingState> _selectedStates;
  @override
  List<SelectingState> get selectedStates {
    if (_selectedStates is EqualUnmodifiableListView) return _selectedStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedStates);
  }

  @override
  String toString() {
    return 'NewMixState(selectingState: $selectingState, selectedStates: $selectedStates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewMixStateImpl &&
            (identical(other.selectingState, selectingState) ||
                other.selectingState == selectingState) &&
            const DeepCollectionEquality()
                .equals(other._selectedStates, _selectedStates));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectingState,
      const DeepCollectionEquality().hash(_selectedStates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewMixStateImplCopyWith<_$NewMixStateImpl> get copyWith =>
      __$$NewMixStateImplCopyWithImpl<_$NewMixStateImpl>(this, _$identity);
}

abstract class _NewMixState extends NewMixState {
  const factory _NewMixState(
      {required final SelectingState selectingState,
      required final List<SelectingState> selectedStates}) = _$NewMixStateImpl;
  const _NewMixState._() : super._();

  @override
  SelectingState get selectingState;
  @override
  List<SelectingState> get selectedStates;
  @override
  @JsonKey(ignore: true)
  _$$NewMixStateImplCopyWith<_$NewMixStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
