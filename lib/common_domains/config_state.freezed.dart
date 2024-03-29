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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfigState {
  List<Artist> get artists => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  List<FromSource> get fromSources => throw _privateConstructorUsedError;
  List<Group> get groups => throw _privateConstructorUsedError;
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
      {List<Artist> artists,
      List<Category> categories,
      List<FromSource> fromSources,
      List<Group> groups,
      bool isLoading});
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
    Object? artists = null,
    Object? categories = null,
    Object? fromSources = null,
    Object? groups = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      fromSources: null == fromSources
          ? _value.fromSources
          : fromSources // ignore: cast_nullable_to_non_nullable
              as List<FromSource>,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigStateImplCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$ConfigStateImplCopyWith(
          _$ConfigStateImpl value, $Res Function(_$ConfigStateImpl) then) =
      __$$ConfigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Artist> artists,
      List<Category> categories,
      List<FromSource> fromSources,
      List<Group> groups,
      bool isLoading});
}

/// @nodoc
class __$$ConfigStateImplCopyWithImpl<$Res>
    extends _$ConfigStateCopyWithImpl<$Res, _$ConfigStateImpl>
    implements _$$ConfigStateImplCopyWith<$Res> {
  __$$ConfigStateImplCopyWithImpl(
      _$ConfigStateImpl _value, $Res Function(_$ConfigStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artists = null,
    Object? categories = null,
    Object? fromSources = null,
    Object? groups = null,
    Object? isLoading = null,
  }) {
    return _then(_$ConfigStateImpl(
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      fromSources: null == fromSources
          ? _value._fromSources
          : fromSources // ignore: cast_nullable_to_non_nullable
              as List<FromSource>,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConfigStateImpl extends _ConfigState {
  const _$ConfigStateImpl(
      {required final List<Artist> artists,
      required final List<Category> categories,
      required final List<FromSource> fromSources,
      required final List<Group> groups,
      required this.isLoading})
      : _artists = artists,
        _categories = categories,
        _fromSources = fromSources,
        _groups = groups,
        super._();

  final List<Artist> _artists;
  @override
  List<Artist> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<FromSource> _fromSources;
  @override
  List<FromSource> get fromSources {
    if (_fromSources is EqualUnmodifiableListView) return _fromSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fromSources);
  }

  final List<Group> _groups;
  @override
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ConfigState(artists: $artists, categories: $categories, fromSources: $fromSources, groups: $groups, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigStateImpl &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._fromSources, _fromSources) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_fromSources),
      const DeepCollectionEquality().hash(_groups),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigStateImplCopyWith<_$ConfigStateImpl> get copyWith =>
      __$$ConfigStateImplCopyWithImpl<_$ConfigStateImpl>(this, _$identity);
}

abstract class _ConfigState extends ConfigState {
  const factory _ConfigState(
      {required final List<Artist> artists,
      required final List<Category> categories,
      required final List<FromSource> fromSources,
      required final List<Group> groups,
      required final bool isLoading}) = _$ConfigStateImpl;
  const _ConfigState._() : super._();

  @override
  List<Artist> get artists;
  @override
  List<Category> get categories;
  @override
  List<FromSource> get fromSources;
  @override
  List<Group> get groups;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ConfigStateImplCopyWith<_$ConfigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
