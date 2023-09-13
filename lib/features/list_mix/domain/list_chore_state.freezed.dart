// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_chore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListChoreState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListChoreStateCopyWith<ListChoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListChoreStateCopyWith<$Res> {
  factory $ListChoreStateCopyWith(
          ListChoreState value, $Res Function(ListChoreState) then) =
      _$ListChoreStateCopyWithImpl<$Res, ListChoreState>;
  @useResult
  $Res call({bool isLoading, List<Playlist> playlists});
}

/// @nodoc
class _$ListChoreStateCopyWithImpl<$Res, $Val extends ListChoreState>
    implements $ListChoreStateCopyWith<$Res> {
  _$ListChoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? playlists = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListChoreStateCopyWith<$Res>
    implements $ListChoreStateCopyWith<$Res> {
  factory _$$_ListChoreStateCopyWith(
          _$_ListChoreState value, $Res Function(_$_ListChoreState) then) =
      __$$_ListChoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Playlist> playlists});
}

/// @nodoc
class __$$_ListChoreStateCopyWithImpl<$Res>
    extends _$ListChoreStateCopyWithImpl<$Res, _$_ListChoreState>
    implements _$$_ListChoreStateCopyWith<$Res> {
  __$$_ListChoreStateCopyWithImpl(
      _$_ListChoreState _value, $Res Function(_$_ListChoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? playlists = null,
  }) {
    return _then(_$_ListChoreState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
    ));
  }
}

/// @nodoc

class _$_ListChoreState implements _ListChoreState {
  const _$_ListChoreState(
      {required this.isLoading, required final List<Playlist> playlists})
      : _playlists = playlists;

  @override
  final bool isLoading;
  final List<Playlist> _playlists;
  @override
  List<Playlist> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  String toString() {
    return 'ListChoreState(isLoading: $isLoading, playlists: $playlists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListChoreState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_playlists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListChoreStateCopyWith<_$_ListChoreState> get copyWith =>
      __$$_ListChoreStateCopyWithImpl<_$_ListChoreState>(this, _$identity);
}

abstract class _ListChoreState implements ListChoreState {
  const factory _ListChoreState(
      {required final bool isLoading,
      required final List<Playlist> playlists}) = _$_ListChoreState;

  @override
  bool get isLoading;
  @override
  List<Playlist> get playlists;
  @override
  @JsonKey(ignore: true)
  _$$_ListChoreStateCopyWith<_$_ListChoreState> get copyWith =>
      throw _privateConstructorUsedError;
}