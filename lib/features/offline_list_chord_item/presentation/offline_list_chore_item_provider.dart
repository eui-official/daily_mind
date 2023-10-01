import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListChoreItemNotifier extends StateNotifier<void> {
  late DailyMindAudioHandler audioHandler;

  OfflineListChoreItemNotifier() : super({});

  void onSetAudioHandler(DailyMindAudioHandler newAudioHandler) {
    audioHandler = newAudioHandler;
  }

  void onPlayChore(List<PlaylistItem> items) {
    audioHandler.onInitPlaylist(items);
  }
}

final offlineListChoreItemProvider =
    StateNotifierProvider<OfflineListChoreItemNotifier, void>((ref) {
  return OfflineListChoreItemNotifier();
});
