import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryCardNotifier extends StateNotifier<void> {
  late DailyMindAudioHandler audioHandler;

  StoryCardNotifier() : super({});

  void onSetAudioHandler(DailyMindAudioHandler newAudioHandler) {
    audioHandler = newAudioHandler;
  }

  void onPlayStory(Story story) {
    audioHandler.onInitStory(story);
  }
}

final storyCardProvider = StateNotifierProvider<StoryCardNotifier, void>((ref) {
  return StoryCardNotifier();
});
