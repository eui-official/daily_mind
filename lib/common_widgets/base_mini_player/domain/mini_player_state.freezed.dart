// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mini_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MiniPlayerState {
  bool get isShow => throw _privateConstructorUsedError;
  NetworkType get networkType => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MiniPlayerStateCopyWith<MiniPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiniPlayerStateCopyWith<$Res> {
  factory $MiniPlayerStateCopyWith(
          MiniPlayerState value, $Res Function(MiniPlayerState) then) =
      _$MiniPlayerStateCopyWithImpl<$Res, MiniPlayerState>;
  @useResult
  $Res call({bool isShow, NetworkType networkType, VoidCallback? onTap});
}

/// @nodoc
class _$MiniPlayerStateCopyWithImpl<$Res, $Val extends MiniPlayerState>
    implements $MiniPlayerStateCopyWith<$Res> {
  _$MiniPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShow = null,
    Object? networkType = null,
    Object? onTap = freezed,
  }) {
    return _then(_value.copyWith(
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as NetworkType,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MiniPlayerStateImplCopyWith<$Res>
    implements $MiniPlayerStateCopyWith<$Res> {
  factory _$$MiniPlayerStateImplCopyWith(_$MiniPlayerStateImpl value,
          $Res Function(_$MiniPlayerStateImpl) then) =
      __$$MiniPlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isShow, NetworkType networkType, VoidCallback? onTap});
}

/// @nodoc
class __$$MiniPlayerStateImplCopyWithImpl<$Res>
    extends _$MiniPlayerStateCopyWithImpl<$Res, _$MiniPlayerStateImpl>
    implements _$$MiniPlayerStateImplCopyWith<$Res> {
  __$$MiniPlayerStateImplCopyWithImpl(
      _$MiniPlayerStateImpl _value, $Res Function(_$MiniPlayerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShow = null,
    Object? networkType = null,
    Object? onTap = freezed,
  }) {
    return _then(_$MiniPlayerStateImpl(
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as NetworkType,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$MiniPlayerStateImpl implements _MiniPlayerState {
  const _$MiniPlayerStateImpl(
      {required this.isShow, required this.networkType, this.onTap});

  @override
  final bool isShow;
  @override
  final NetworkType networkType;
  @override
  final VoidCallback? onTap;

  @override
  String toString() {
    return 'MiniPlayerState(isShow: $isShow, networkType: $networkType, onTap: $onTap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MiniPlayerStateImpl &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.networkType, networkType) ||
                other.networkType == networkType) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isShow, networkType, onTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MiniPlayerStateImplCopyWith<_$MiniPlayerStateImpl> get copyWith =>
      __$$MiniPlayerStateImplCopyWithImpl<_$MiniPlayerStateImpl>(
          this, _$identity);
}

abstract class _MiniPlayerState implements MiniPlayerState {
  const factory _MiniPlayerState(
      {required final bool isShow,
      required final NetworkType networkType,
      final VoidCallback? onTap}) = _$MiniPlayerStateImpl;

  @override
  bool get isShow;
  @override
  NetworkType get networkType;
  @override
  VoidCallback? get onTap;
  @override
  @JsonKey(ignore: true)
  _$$MiniPlayerStateImplCopyWith<_$MiniPlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
