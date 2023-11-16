// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mix_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MixState {
  String get title => throw _privateConstructorUsedError;
  List<MixItem> get mixItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MixStateCopyWith<MixState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixStateCopyWith<$Res> {
  factory $MixStateCopyWith(MixState value, $Res Function(MixState) then) =
      _$MixStateCopyWithImpl<$Res, MixState>;
  @useResult
  $Res call({String title, List<MixItem> mixItems});
}

/// @nodoc
class _$MixStateCopyWithImpl<$Res, $Val extends MixState>
    implements $MixStateCopyWith<$Res> {
  _$MixStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? mixItems = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mixItems: null == mixItems
          ? _value.mixItems
          : mixItems // ignore: cast_nullable_to_non_nullable
              as List<MixItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MixStateImplCopyWith<$Res>
    implements $MixStateCopyWith<$Res> {
  factory _$$MixStateImplCopyWith(
          _$MixStateImpl value, $Res Function(_$MixStateImpl) then) =
      __$$MixStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<MixItem> mixItems});
}

/// @nodoc
class __$$MixStateImplCopyWithImpl<$Res>
    extends _$MixStateCopyWithImpl<$Res, _$MixStateImpl>
    implements _$$MixStateImplCopyWith<$Res> {
  __$$MixStateImplCopyWithImpl(
      _$MixStateImpl _value, $Res Function(_$MixStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? mixItems = null,
  }) {
    return _then(_$MixStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mixItems: null == mixItems
          ? _value._mixItems
          : mixItems // ignore: cast_nullable_to_non_nullable
              as List<MixItem>,
    ));
  }
}

/// @nodoc

class _$MixStateImpl extends _MixState {
  const _$MixStateImpl(
      {required this.title, required final List<MixItem> mixItems})
      : _mixItems = mixItems,
        super._();

  @override
  final String title;
  final List<MixItem> _mixItems;
  @override
  List<MixItem> get mixItems {
    if (_mixItems is EqualUnmodifiableListView) return _mixItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mixItems);
  }

  @override
  String toString() {
    return 'MixState(title: $title, mixItems: $mixItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MixStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._mixItems, _mixItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_mixItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MixStateImplCopyWith<_$MixStateImpl> get copyWith =>
      __$$MixStateImplCopyWithImpl<_$MixStateImpl>(this, _$identity);
}

abstract class _MixState extends MixState {
  const factory _MixState(
      {required final String title,
      required final List<MixItem> mixItems}) = _$MixStateImpl;
  const _MixState._() : super._();

  @override
  String get title;
  @override
  List<MixItem> get mixItems;
  @override
  @JsonKey(ignore: true)
  _$$MixStateImplCopyWith<_$MixStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
