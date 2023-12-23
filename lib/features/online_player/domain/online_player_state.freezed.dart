// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnlinePlayerState {
  bool get isExpanded => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlinePlayerStateCopyWith<OnlinePlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlinePlayerStateCopyWith<$Res> {
  factory $OnlinePlayerStateCopyWith(
          OnlinePlayerState value, $Res Function(OnlinePlayerState) then) =
      _$OnlinePlayerStateCopyWithImpl<$Res, OnlinePlayerState>;
  @useResult
  $Res call({bool isExpanded, String name});
}

/// @nodoc
class _$OnlinePlayerStateCopyWithImpl<$Res, $Val extends OnlinePlayerState>
    implements $OnlinePlayerStateCopyWith<$Res> {
  _$OnlinePlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnlinePlayerStateImplCopyWith<$Res>
    implements $OnlinePlayerStateCopyWith<$Res> {
  factory _$$OnlinePlayerStateImplCopyWith(_$OnlinePlayerStateImpl value,
          $Res Function(_$OnlinePlayerStateImpl) then) =
      __$$OnlinePlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isExpanded, String name});
}

/// @nodoc
class __$$OnlinePlayerStateImplCopyWithImpl<$Res>
    extends _$OnlinePlayerStateCopyWithImpl<$Res, _$OnlinePlayerStateImpl>
    implements _$$OnlinePlayerStateImplCopyWith<$Res> {
  __$$OnlinePlayerStateImplCopyWithImpl(_$OnlinePlayerStateImpl _value,
      $Res Function(_$OnlinePlayerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? name = null,
  }) {
    return _then(_$OnlinePlayerStateImpl(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnlinePlayerStateImpl implements _OnlinePlayerState {
  const _$OnlinePlayerStateImpl({required this.isExpanded, required this.name});

  @override
  final bool isExpanded;
  @override
  final String name;

  @override
  String toString() {
    return 'OnlinePlayerState(isExpanded: $isExpanded, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlinePlayerStateImpl &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExpanded, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlinePlayerStateImplCopyWith<_$OnlinePlayerStateImpl> get copyWith =>
      __$$OnlinePlayerStateImplCopyWithImpl<_$OnlinePlayerStateImpl>(
          this, _$identity);
}

abstract class _OnlinePlayerState implements OnlinePlayerState {
  const factory _OnlinePlayerState(
      {required final bool isExpanded,
      required final String name}) = _$OnlinePlayerStateImpl;

  @override
  bool get isExpanded;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$OnlinePlayerStateImplCopyWith<_$OnlinePlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
