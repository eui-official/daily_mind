import 'package:daily_mind/common_applications/base_audio_handler.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineCardNotifier extends StateNotifier<void> {
  final DailyMindAudioHandler audioHandler;

  OnlineCardNotifier({
    required this.audioHandler,
  }) : super({});

  void onPlayItem(
    Item item,
    List<Item> fullItems,
  ) {
    audioHandler.onInitOnline(
      item,
      fullItems,
    );
  }
}

final onlineCardProvider =
    StateNotifierProvider<OnlineCardNotifier, void>((ref) {
  final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

  return OnlineCardNotifier(
    audioHandler: baseAudioHandler,
  );
});
