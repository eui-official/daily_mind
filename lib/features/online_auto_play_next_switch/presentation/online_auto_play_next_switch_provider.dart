import 'package:daily_mind/common_applications/base_audio_handler/application/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineAutoPlayNextSwitchNotifier extends StateNotifier<bool> {
  final DailyMindAudioHandler baseAudioHandler;

  OnlineAutoPlayNextSwitchNotifier({
    required this.baseAudioHandler,
  }) : super(true);

  void onChanged(bool isAutoPlayNext) {
    state = isAutoPlayNext;
    baseAudioHandler.onOnlineUpdateAutoPlayNext(isAutoPlayNext);
  }
}

final onlineAutoPlayNextSwitchProvider =
    StateNotifierProvider<OnlineAutoPlayNextSwitchNotifier, bool>((ref) {
  final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

  return OnlineAutoPlayNextSwitchNotifier(
    baseAudioHandler: baseAudioHandler,
  );
});
