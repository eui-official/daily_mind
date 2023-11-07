// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioCategory {
  Category get category => throw _privateConstructorUsedError;
  List<Audio> get audios => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioCategoryCopyWith<AudioCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioCategoryCopyWith<$Res> {
  factory $AudioCategoryCopyWith(
          AudioCategory value, $Res Function(AudioCategory) then) =
      _$AudioCategoryCopyWithImpl<$Res, AudioCategory>;
  @useResult
  $Res call({Category category, List<Audio> audios});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$AudioCategoryCopyWithImpl<$Res, $Val extends AudioCategory>
    implements $AudioCategoryCopyWith<$Res> {
  _$AudioCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? audios = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      audios: null == audios
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
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
abstract class _$$AudioCategoryImplCopyWith<$Res>
    implements $AudioCategoryCopyWith<$Res> {
  factory _$$AudioCategoryImplCopyWith(
          _$AudioCategoryImpl value, $Res Function(_$AudioCategoryImpl) then) =
      __$$AudioCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Category category, List<Audio> audios});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$AudioCategoryImplCopyWithImpl<$Res>
    extends _$AudioCategoryCopyWithImpl<$Res, _$AudioCategoryImpl>
    implements _$$AudioCategoryImplCopyWith<$Res> {
  __$$AudioCategoryImplCopyWithImpl(
      _$AudioCategoryImpl _value, $Res Function(_$AudioCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? audios = null,
  }) {
    return _then(_$AudioCategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      audios: null == audios
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
    ));
  }
}

/// @nodoc

class _$AudioCategoryImpl implements _AudioCategory {
  const _$AudioCategoryImpl(
      {required this.category, required final List<Audio> audios})
      : _audios = audios;

  @override
  final Category category;
  final List<Audio> _audios;
  @override
  List<Audio> get audios {
    if (_audios is EqualUnmodifiableListView) return _audios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audios);
  }

  @override
  String toString() {
    return 'AudioCategory(category: $category, audios: $audios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._audios, _audios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_audios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioCategoryImplCopyWith<_$AudioCategoryImpl> get copyWith =>
      __$$AudioCategoryImplCopyWithImpl<_$AudioCategoryImpl>(this, _$identity);
}

abstract class _AudioCategory implements AudioCategory {
  const factory _AudioCategory(
      {required final Category category,
      required final List<Audio> audios}) = _$AudioCategoryImpl;

  @override
  Category get category;
  @override
  List<Audio> get audios;
  @override
  @JsonKey(ignore: true)
  _$$AudioCategoryImplCopyWith<_$AudioCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
