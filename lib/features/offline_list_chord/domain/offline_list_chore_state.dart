import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_list_chore_state.freezed.dart';

@freezed
class OfflineListChoreState with _$OfflineListChoreState {
  const factory OfflineListChoreState({
    required bool isLoading,
    required List<Playlist> playlists,
  }) = _OfflineListChoreState;
}
