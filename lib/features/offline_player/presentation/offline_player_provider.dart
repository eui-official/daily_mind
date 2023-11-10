import 'dart:async';

import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflinePlayerNotifier extends StateNotifier<void> {
  Timer? timer;
  final DailyMindBackgroundHandler backgroundHandler;

  OfflinePlayerNotifier({
    required this.backgroundHandler,
  }) : super({});

  void onUpdateVolume(double volume, String itemId, int playlistId) {
    backgroundHandler.onUpdateOfflineVolume(volume, itemId, playlistId);
  }
}

final playMixProvider =
    StateNotifierProvider<OfflinePlayerNotifier, void>((ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

  return OfflinePlayerNotifier(
    backgroundHandler: baseBackgroundHandler,
  );
});
