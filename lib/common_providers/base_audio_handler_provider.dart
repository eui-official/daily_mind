import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseBackgroundHandlerNotifier
    extends StateNotifier<DailyMindBackgroundHandler> {
  BaseBackgroundHandlerNotifier() : super(DailyMindBackgroundHandler());

  void onSetBackgroundHandler(DailyMindBackgroundHandler newBackgroundHandler) {
    state = newBackgroundHandler;
  }
}

final baseBackgroundHandlerProvider = StateNotifierProvider<
    BaseBackgroundHandlerNotifier, DailyMindBackgroundHandler>((ref) {
  return BaseBackgroundHandlerNotifier();
});
