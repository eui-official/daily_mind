// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_list_chore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OfflineListChoreState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OfflineListChoreStateCopyWith<OfflineListChoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineListChoreStateCopyWith<$Res> {
  factory $OfflineListChoreStateCopyWith(OfflineListChoreState value,
          $Res Function(OfflineListChoreState) then) =
      _$OfflineListChoreStateCopyWithImpl<$Res, OfflineListChoreState>;
  @useResult
  $Res call({bool isLoading, List<Playlist> playlists});
}

/// @nodoc
class _$OfflineListChoreStateCopyWithImpl<$Res,
        $Val extends OfflineListChoreState>
    implements $OfflineListChoreStateCopyWith<$Res> {
  _$OfflineListChoreStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_OfflineListChoreStateCopyWith<$Res>
    implements $OfflineListChoreStateCopyWith<$Res> {
  factory _$$_OfflineListChoreStateCopyWith(_$_OfflineListChoreState value,
          $Res Function(_$_OfflineListChoreState) then) =
      __$$_OfflineListChoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Playlist> playlists});
}

/// @nodoc
class __$$_OfflineListChoreStateCopyWithImpl<$Res>
    extends _$OfflineListChoreStateCopyWithImpl<$Res, _$_OfflineListChoreState>
    implements _$$_OfflineListChoreStateCopyWith<$Res> {
  __$$_OfflineListChoreStateCopyWithImpl(_$_OfflineListChoreState _value,
      $Res Function(_$_OfflineListChoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? playlists = null,
  }) {
    return _then(_$_OfflineListChoreState(
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

class _$_OfflineListChoreState extends _OfflineListChoreState {
  const _$_OfflineListChoreState(
      {required this.isLoading, required final List<Playlist> playlists})
      : _playlists = playlists,
        super._();

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
    return 'OfflineListChoreState(isLoading: $isLoading, playlists: $playlists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfflineListChoreState &&
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
  _$$_OfflineListChoreStateCopyWith<_$_OfflineListChoreState> get copyWith =>
      __$$_OfflineListChoreStateCopyWithImpl<_$_OfflineListChoreState>(
          this, _$identity);
}

abstract class _OfflineListChoreState extends OfflineListChoreState {
  const factory _OfflineListChoreState(
      {required final bool isLoading,
      required final List<Playlist> playlists}) = _$_OfflineListChoreState;
  const _OfflineListChoreState._() : super._();

  @override
  bool get isLoading;
  @override
  List<Playlist> get playlists;
  @override
  @JsonKey(ignore: true)
  _$$_OfflineListChoreStateCopyWith<_$_OfflineListChoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
