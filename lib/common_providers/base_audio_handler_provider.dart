import 'package:daily_mind/common_applications/base_audio_handler/application/base_audio_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseAudioHandlerNotifier extends StateNotifier<DailyMindAudioHandler> {
  BaseAudioHandlerNotifier() : super(DailyMindAudioHandler());

  void onSetAudioHandler(DailyMindAudioHandler newAudioHandler) {
    state = newAudioHandler;
  }
}

final baseAudioHandlerProvider =
    StateNotifierProvider<BaseAudioHandlerNotifier, DailyMindAudioHandler>(
        (ref) {
  return BaseAudioHandlerNotifier();
});
