// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_navigation_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppNavigationBarState {
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppNavigationBarStateCopyWith<AppNavigationBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNavigationBarStateCopyWith<$Res> {
  factory $AppNavigationBarStateCopyWith(AppNavigationBarState value,
          $Res Function(AppNavigationBarState) then) =
      _$AppNavigationBarStateCopyWithImpl<$Res, AppNavigationBarState>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$AppNavigationBarStateCopyWithImpl<$Res,
        $Val extends AppNavigationBarState>
    implements $AppNavigationBarStateCopyWith<$Res> {
  _$AppNavigationBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppNavigationBarStateImplCopyWith<$Res>
    implements $AppNavigationBarStateCopyWith<$Res> {
  factory _$$AppNavigationBarStateImplCopyWith(
          _$AppNavigationBarStateImpl value,
          $Res Function(_$AppNavigationBarStateImpl) then) =
      __$$AppNavigationBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$AppNavigationBarStateImplCopyWithImpl<$Res>
    extends _$AppNavigationBarStateCopyWithImpl<$Res,
        _$AppNavigationBarStateImpl>
    implements _$$AppNavigationBarStateImplCopyWith<$Res> {
  __$$AppNavigationBarStateImplCopyWithImpl(_$AppNavigationBarStateImpl _value,
      $Res Function(_$AppNavigationBarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$AppNavigationBarStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppNavigationBarStateImpl implements _AppNavigationBarState {
  const _$AppNavigationBarStateImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'AppNavigationBarState(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNavigationBarStateImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNavigationBarStateImplCopyWith<_$AppNavigationBarStateImpl>
      get copyWith => __$$AppNavigationBarStateImplCopyWithImpl<
          _$AppNavigationBarStateImpl>(this, _$identity);
}

abstract class _AppNavigationBarState implements AppNavigationBarState {
  const factory _AppNavigationBarState({required final int index}) =
      _$AppNavigationBarStateImpl;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$AppNavigationBarStateImplCopyWith<_$AppNavigationBarStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
