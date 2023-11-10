import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineAutoPlayNextSwitchNotifier extends StateNotifier<bool> {
  final DailyMindBackgroundHandler backgroundHandler;

  OnlineAutoPlayNextSwitchNotifier({
    required this.backgroundHandler,
  }) : super(true);

  void onChanged(bool isAutoPlayNext) {
    state = isAutoPlayNext;
    backgroundHandler.onOnlineUpdateAutoPlayNext(isAutoPlayNext);
  }
}

final onlineAutoPlayNextSwitchProvider =
    StateNotifierProvider<OnlineAutoPlayNextSwitchNotifier, bool>((ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

  return OnlineAutoPlayNextSwitchNotifier(
    backgroundHandler: baseBackgroundHandler,
  );
});
