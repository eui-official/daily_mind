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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseInternetCheckState {
  ConnectivityResult get connectivityResult =>
      throw _privateConstructorUsedError;

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
  $Res call({ConnectivityResult connectivityResult});
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
    Object? connectivityResult = null,
  }) {
    return _then(_value.copyWith(
      connectivityResult: null == connectivityResult
          ? _value.connectivityResult
          : connectivityResult // ignore: cast_nullable_to_non_nullable
              as ConnectivityResult,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseInternetCheckStateCopyWith<$Res>
    implements $BaseInternetCheckStateCopyWith<$Res> {
  factory _$$_BaseInternetCheckStateCopyWith(_$_BaseInternetCheckState value,
          $Res Function(_$_BaseInternetCheckState) then) =
      __$$_BaseInternetCheckStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConnectivityResult connectivityResult});
}

/// @nodoc
class __$$_BaseInternetCheckStateCopyWithImpl<$Res>
    extends _$BaseInternetCheckStateCopyWithImpl<$Res,
        _$_BaseInternetCheckState>
    implements _$$_BaseInternetCheckStateCopyWith<$Res> {
  __$$_BaseInternetCheckStateCopyWithImpl(_$_BaseInternetCheckState _value,
      $Res Function(_$_BaseInternetCheckState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectivityResult = null,
  }) {
    return _then(_$_BaseInternetCheckState(
      connectivityResult: null == connectivityResult
          ? _value.connectivityResult
          : connectivityResult // ignore: cast_nullable_to_non_nullable
              as ConnectivityResult,
    ));
  }
}

/// @nodoc

class _$_BaseInternetCheckState extends _BaseInternetCheckState {
  const _$_BaseInternetCheckState({required this.connectivityResult})
      : super._();

  @override
  final ConnectivityResult connectivityResult;

  @override
  String toString() {
    return 'BaseInternetCheckState(connectivityResult: $connectivityResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseInternetCheckState &&
            (identical(other.connectivityResult, connectivityResult) ||
                other.connectivityResult == connectivityResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connectivityResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseInternetCheckStateCopyWith<_$_BaseInternetCheckState> get copyWith =>
      __$$_BaseInternetCheckStateCopyWithImpl<_$_BaseInternetCheckState>(
          this, _$identity);
}

abstract class _BaseInternetCheckState extends BaseInternetCheckState {
  const factory _BaseInternetCheckState(
          {required final ConnectivityResult connectivityResult}) =
      _$_BaseInternetCheckState;
  const _BaseInternetCheckState._() : super._();

  @override
  ConnectivityResult get connectivityResult;
  @override
  @JsonKey(ignore: true)
  _$$_BaseInternetCheckStateCopyWith<_$_BaseInternetCheckState> get copyWith =>
      throw _privateConstructorUsedError;
}
