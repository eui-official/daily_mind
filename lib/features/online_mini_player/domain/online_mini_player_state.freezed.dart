// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_mini_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnlineMiniPlayerState {
  Category? get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlineMiniPlayerStateCopyWith<OnlineMiniPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineMiniPlayerStateCopyWith<$Res> {
  factory $OnlineMiniPlayerStateCopyWith(OnlineMiniPlayerState value,
          $Res Function(OnlineMiniPlayerState) then) =
      _$OnlineMiniPlayerStateCopyWithImpl<$Res, OnlineMiniPlayerState>;
  @useResult
  $Res call({Category? category});

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$OnlineMiniPlayerStateCopyWithImpl<$Res,
        $Val extends OnlineMiniPlayerState>
    implements $OnlineMiniPlayerStateCopyWith<$Res> {
  _$OnlineMiniPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnlineMiniPlayerStateImplCopyWith<$Res>
    implements $OnlineMiniPlayerStateCopyWith<$Res> {
  factory _$$OnlineMiniPlayerStateImplCopyWith(
          _$OnlineMiniPlayerStateImpl value,
          $Res Function(_$OnlineMiniPlayerStateImpl) then) =
      __$$OnlineMiniPlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Category? category});

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$OnlineMiniPlayerStateImplCopyWithImpl<$Res>
    extends _$OnlineMiniPlayerStateCopyWithImpl<$Res,
        _$OnlineMiniPlayerStateImpl>
    implements _$$OnlineMiniPlayerStateImplCopyWith<$Res> {
  __$$OnlineMiniPlayerStateImplCopyWithImpl(_$OnlineMiniPlayerStateImpl _value,
      $Res Function(_$OnlineMiniPlayerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_$OnlineMiniPlayerStateImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }
}

/// @nodoc

class _$OnlineMiniPlayerStateImpl implements _OnlineMiniPlayerState {
  const _$OnlineMiniPlayerStateImpl({this.category});

  @override
  final Category? category;

  @override
  String toString() {
    return 'OnlineMiniPlayerState(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineMiniPlayerStateImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineMiniPlayerStateImplCopyWith<_$OnlineMiniPlayerStateImpl>
      get copyWith => __$$OnlineMiniPlayerStateImplCopyWithImpl<
          _$OnlineMiniPlayerStateImpl>(this, _$identity);
}

abstract class _OnlineMiniPlayerState implements OnlineMiniPlayerState {
  const factory _OnlineMiniPlayerState({final Category? category}) =
      _$OnlineMiniPlayerStateImpl;

  @override
  Category? get category;
  @override
  @JsonKey(ignore: true)
  _$$OnlineMiniPlayerStateImplCopyWith<_$OnlineMiniPlayerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
