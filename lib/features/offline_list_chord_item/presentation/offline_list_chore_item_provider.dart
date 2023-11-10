import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListChoreItemNotifier extends StateNotifier<void> {
  final DailyMindBackgroundHandler backgroundHandler;

  OfflineListChoreItemNotifier({
    required this.backgroundHandler,
  }) : super({});

  void onPlayChore(Playlist playlist) {
    backgroundHandler.onInitOffline(playlist);
  }

  void onDispose() {
    backgroundHandler.onOfflineDispose();
  }
}

final offlineListChoreItemProvider =
    StateNotifierProvider<OfflineListChoreItemNotifier, void>((ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

  return OfflineListChoreItemNotifier(
    backgroundHandler: baseBackgroundHandler,
  );
});
