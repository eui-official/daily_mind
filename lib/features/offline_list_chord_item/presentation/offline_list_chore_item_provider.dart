import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListChoreItemNotifier extends StateNotifier<void> {
  final DailyMindAudioHandler audioHandler;

  OfflineListChoreItemNotifier({
    required this.audioHandler,
  }) : super({});

  void onPlayChore(
    Playlist playlist,
    List<PlaylistItem> items,
  ) {
    audioHandler.onInitPlaylist(
      playlist,
      items,
    );
  }
}

final offlineListChoreItemProvider =
    StateNotifierProvider<OfflineListChoreItemNotifier, void>((ref) {
  final baseAudioHandlerNotifier = ref.read(baseAudioHandlerProvider.notifier);

  return OfflineListChoreItemNotifier(
    audioHandler: baseAudioHandlerNotifier.audioHandler,
  );
});
