import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_chore_state.freezed.dart';

@freezed
class ListChoreState with _$ListChoreState {
  const factory ListChoreState({
    required bool isLoading,
    required List<Playlist> playlists,
  }) = _ListChoreState;
}
