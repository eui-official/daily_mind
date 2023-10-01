import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryCardNotifier extends StateNotifier<void> {
  final DailyMindAudioHandler audioHandler;

  StoryCardNotifier({
    required this.audioHandler,
  }) : super({});

  void onPlayStory(Story story) {
    audioHandler.onInitStory(story);
  }
}

final storyCardProvider = StateNotifierProvider<StoryCardNotifier, void>((ref) {
  final baseAudioHandlerNotifier = ref.read(baseAudioHandlerProvider.notifier);

  return StoryCardNotifier(audioHandler: baseAudioHandlerNotifier.audioHandler);
});
