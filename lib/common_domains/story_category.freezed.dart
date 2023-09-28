// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryCategory {
  Category get category => throw _privateConstructorUsedError;
  List<Story> get stories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryCategoryCopyWith<StoryCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCategoryCopyWith<$Res> {
  factory $StoryCategoryCopyWith(
          StoryCategory value, $Res Function(StoryCategory) then) =
      _$StoryCategoryCopyWithImpl<$Res, StoryCategory>;
  @useResult
  $Res call({Category category, List<Story> stories});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$StoryCategoryCopyWithImpl<$Res, $Val extends StoryCategory>
    implements $StoryCategoryCopyWith<$Res> {
  _$StoryCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? stories = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoryCategoryCopyWith<$Res>
    implements $StoryCategoryCopyWith<$Res> {
  factory _$$_StoryCategoryCopyWith(
          _$_StoryCategory value, $Res Function(_$_StoryCategory) then) =
      __$$_StoryCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Category category, List<Story> stories});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_StoryCategoryCopyWithImpl<$Res>
    extends _$StoryCategoryCopyWithImpl<$Res, _$_StoryCategory>
    implements _$$_StoryCategoryCopyWith<$Res> {
  __$$_StoryCategoryCopyWithImpl(
      _$_StoryCategory _value, $Res Function(_$_StoryCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? stories = null,
  }) {
    return _then(_$_StoryCategory(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

/// @nodoc

class _$_StoryCategory implements _StoryCategory {
  const _$_StoryCategory(
      {required this.category, required final List<Story> stories})
      : _stories = stories;

  @override
  final Category category;
  final List<Story> _stories;
  @override
  List<Story> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString() {
    return 'StoryCategory(category: $category, stories: $stories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryCategory &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_stories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryCategoryCopyWith<_$_StoryCategory> get copyWith =>
      __$$_StoryCategoryCopyWithImpl<_$_StoryCategory>(this, _$identity);
}

abstract class _StoryCategory implements StoryCategory {
  const factory _StoryCategory(
      {required final Category category,
      required final List<Story> stories}) = _$_StoryCategory;

  @override
  Category get category;
  @override
  List<Story> get stories;
  @override
  @JsonKey(ignore: true)
  _$$_StoryCategoryCopyWith<_$_StoryCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
