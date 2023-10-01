import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseAudioHandlerNotifier extends StateNotifier<void> {
  late DailyMindAudioHandler audioHandler;

  BaseAudioHandlerNotifier() : super({});

  void onSetAudioHandler(DailyMindAudioHandler newAudioHandler) {
    audioHandler = newAudioHandler;
  }
}

final baseAudioHandlerProvider =
    StateNotifierProvider<BaseAudioHandlerNotifier, void>((ref) {
  return BaseAudioHandlerNotifier();
});
