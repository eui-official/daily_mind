// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_internet_check_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseInternetCheckState {
  bool get hasInternetAccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseInternetCheckStateCopyWith<BaseInternetCheckState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseInternetCheckStateCopyWith<$Res> {
  factory $BaseInternetCheckStateCopyWith(BaseInternetCheckState value,
          $Res Function(BaseInternetCheckState) then) =
      _$BaseInternetCheckStateCopyWithImpl<$Res, BaseInternetCheckState>;
  @useResult
  $Res call({bool hasInternetAccess});
}

/// @nodoc
class _$BaseInternetCheckStateCopyWithImpl<$Res,
        $Val extends BaseInternetCheckState>
    implements $BaseInternetCheckStateCopyWith<$Res> {
  _$BaseInternetCheckStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasInternetAccess = null,
  }) {
    return _then(_value.copyWith(
      hasInternetAccess: null == hasInternetAccess
          ? _value.hasInternetAccess
          : hasInternetAccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseInternetCheckStateImplCopyWith<$Res>
    implements $BaseInternetCheckStateCopyWith<$Res> {
  factory _$$BaseInternetCheckStateImplCopyWith(
          _$BaseInternetCheckStateImpl value,
          $Res Function(_$BaseInternetCheckStateImpl) then) =
      __$$BaseInternetCheckStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasInternetAccess});
}

/// @nodoc
class __$$BaseInternetCheckStateImplCopyWithImpl<$Res>
    extends _$BaseInternetCheckStateCopyWithImpl<$Res,
        _$BaseInternetCheckStateImpl>
    implements _$$BaseInternetCheckStateImplCopyWith<$Res> {
  __$$BaseInternetCheckStateImplCopyWithImpl(
      _$BaseInternetCheckStateImpl _value,
      $Res Function(_$BaseInternetCheckStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasInternetAccess = null,
  }) {
    return _then(_$BaseInternetCheckStateImpl(
      hasInternetAccess: null == hasInternetAccess
          ? _value.hasInternetAccess
          : hasInternetAccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BaseInternetCheckStateImpl extends _BaseInternetCheckState {
  const _$BaseInternetCheckStateImpl({required this.hasInternetAccess})
      : super._();

  @override
  final bool hasInternetAccess;

  @override
  String toString() {
    return 'BaseInternetCheckState(hasInternetAccess: $hasInternetAccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseInternetCheckStateImpl &&
            (identical(other.hasInternetAccess, hasInternetAccess) ||
                other.hasInternetAccess == hasInternetAccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasInternetAccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseInternetCheckStateImplCopyWith<_$BaseInternetCheckStateImpl>
      get copyWith => __$$BaseInternetCheckStateImplCopyWithImpl<
          _$BaseInternetCheckStateImpl>(this, _$identity);
}

abstract class _BaseInternetCheckState extends BaseInternetCheckState {
  const factory _BaseInternetCheckState(
      {required final bool hasInternetAccess}) = _$BaseInternetCheckStateImpl;
  const _BaseInternetCheckState._() : super._();

  @override
  bool get hasInternetAccess;
  @override
  @JsonKey(ignore: true)
  _$$BaseInternetCheckStateImplCopyWith<_$BaseInternetCheckStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
