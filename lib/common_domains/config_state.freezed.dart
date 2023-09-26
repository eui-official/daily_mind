// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConfigState {
  List<Category> get categories => throw _privateConstructorUsedError;
  List<SoundType> get soundTypes => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigStateCopyWith<ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigStateCopyWith<$Res> {
  factory $ConfigStateCopyWith(
          ConfigState value, $Res Function(ConfigState) then) =
      _$ConfigStateCopyWithImpl<$Res, ConfigState>;
  @useResult
  $Res call(
      {List<Category> categories, List<SoundType> soundTypes, bool isLoading});
}

/// @nodoc
class _$ConfigStateCopyWithImpl<$Res, $Val extends ConfigState>
    implements $ConfigStateCopyWith<$Res> {
  _$ConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? soundTypes = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      soundTypes: null == soundTypes
          ? _value.soundTypes
          : soundTypes // ignore: cast_nullable_to_non_nullable
              as List<SoundType>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigStateCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$_ConfigStateCopyWith(
          _$_ConfigState value, $Res Function(_$_ConfigState) then) =
      __$$_ConfigStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categories, List<SoundType> soundTypes, bool isLoading});
}

/// @nodoc
class __$$_ConfigStateCopyWithImpl<$Res>
    extends _$ConfigStateCopyWithImpl<$Res, _$_ConfigState>
    implements _$$_ConfigStateCopyWith<$Res> {
  __$$_ConfigStateCopyWithImpl(
      _$_ConfigState _value, $Res Function(_$_ConfigState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? soundTypes = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ConfigState(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      soundTypes: null == soundTypes
          ? _value._soundTypes
          : soundTypes // ignore: cast_nullable_to_non_nullable
              as List<SoundType>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ConfigState implements _ConfigState {
  const _$_ConfigState(
      {required final List<Category> categories,
      required final List<SoundType> soundTypes,
      required this.isLoading})
      : _categories = categories,
        _soundTypes = soundTypes;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<SoundType> _soundTypes;
  @override
  List<SoundType> get soundTypes {
    if (_soundTypes is EqualUnmodifiableListView) return _soundTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soundTypes);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ConfigState(categories: $categories, soundTypes: $soundTypes, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigState &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._soundTypes, _soundTypes) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_soundTypes),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigStateCopyWith<_$_ConfigState> get copyWith =>
      __$$_ConfigStateCopyWithImpl<_$_ConfigState>(this, _$identity);
}

abstract class _ConfigState implements ConfigState {
  const factory _ConfigState(
      {required final List<Category> categories,
      required final List<SoundType> soundTypes,
      required final bool isLoading}) = _$_ConfigState;

  @override
  List<Category> get categories;
  @override
  List<SoundType> get soundTypes;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigStateCopyWith<_$_ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}
