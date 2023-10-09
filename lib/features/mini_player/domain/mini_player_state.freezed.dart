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
  Widget get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  VoidCallback get onPressed => throw _privateConstructorUsedError;
  NetworkType get networkType => throw _privateConstructorUsedError;
  Stream<ProcessingState> get processingStateStream =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {bool isShow,
      Widget image,
      String title,
      VoidCallback onPressed,
      NetworkType networkType,
      Stream<ProcessingState> processingStateStream});
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
    Object? image = null,
    Object? title = null,
    Object? onPressed = null,
    Object? networkType = null,
    Object? processingStateStream = null,
  }) {
    return _then(_value.copyWith(
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Widget,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: null == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as NetworkType,
      processingStateStream: null == processingStateStream
          ? _value.processingStateStream
          : processingStateStream // ignore: cast_nullable_to_non_nullable
              as Stream<ProcessingState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MiniPlayerStateCopyWith<$Res>
    implements $MiniPlayerStateCopyWith<$Res> {
  factory _$$_MiniPlayerStateCopyWith(
          _$_MiniPlayerState value, $Res Function(_$_MiniPlayerState) then) =
      __$$_MiniPlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isShow,
      Widget image,
      String title,
      VoidCallback onPressed,
      NetworkType networkType,
      Stream<ProcessingState> processingStateStream});
}

/// @nodoc
class __$$_MiniPlayerStateCopyWithImpl<$Res>
    extends _$MiniPlayerStateCopyWithImpl<$Res, _$_MiniPlayerState>
    implements _$$_MiniPlayerStateCopyWith<$Res> {
  __$$_MiniPlayerStateCopyWithImpl(
      _$_MiniPlayerState _value, $Res Function(_$_MiniPlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShow = null,
    Object? image = null,
    Object? title = null,
    Object? onPressed = null,
    Object? networkType = null,
    Object? processingStateStream = null,
  }) {
    return _then(_$_MiniPlayerState(
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Widget,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: null == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as NetworkType,
      processingStateStream: null == processingStateStream
          ? _value.processingStateStream
          : processingStateStream // ignore: cast_nullable_to_non_nullable
              as Stream<ProcessingState>,
    ));
  }
}

/// @nodoc

class _$_MiniPlayerState implements _MiniPlayerState {
  const _$_MiniPlayerState(
      {required this.isShow,
      required this.image,
      required this.title,
      required this.onPressed,
      required this.networkType,
      this.processingStateStream = const Stream.empty()});

  @override
  final bool isShow;
  @override
  final Widget image;
  @override
  final String title;
  @override
  final VoidCallback onPressed;
  @override
  final NetworkType networkType;
  @override
  @JsonKey()
  final Stream<ProcessingState> processingStateStream;

  @override
  String toString() {
    return 'MiniPlayerState(isShow: $isShow, image: $image, title: $title, onPressed: $onPressed, networkType: $networkType, processingStateStream: $processingStateStream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MiniPlayerState &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed) &&
            (identical(other.networkType, networkType) ||
                other.networkType == networkType) &&
            (identical(other.processingStateStream, processingStateStream) ||
                other.processingStateStream == processingStateStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isShow, image, title, onPressed,
      networkType, processingStateStream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MiniPlayerStateCopyWith<_$_MiniPlayerState> get copyWith =>
      __$$_MiniPlayerStateCopyWithImpl<_$_MiniPlayerState>(this, _$identity);
}

abstract class _MiniPlayerState implements MiniPlayerState {
  const factory _MiniPlayerState(
          {required final bool isShow,
          required final Widget image,
          required final String title,
          required final VoidCallback onPressed,
          required final NetworkType networkType,
          final Stream<ProcessingState> processingStateStream}) =
      _$_MiniPlayerState;

  @override
  bool get isShow;
  @override
  Widget get image;
  @override
  String get title;
  @override
  VoidCallback get onPressed;
  @override
  NetworkType get networkType;
  @override
  Stream<ProcessingState> get processingStateStream;
  @override
  @JsonKey(ignore: true)
  _$$_MiniPlayerStateCopyWith<_$_MiniPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
