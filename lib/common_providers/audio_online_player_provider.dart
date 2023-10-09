import 'package:daily_mind/common_applications/online_audio_player.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_providers/domain/audio_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioOnlinePlayerNotifier extends StateNotifier<AudioPlayerState> {
  final onlineAudioPlayer = OnlineAudioPlayer();

  AudioOnlinePlayerNotifier()
      : super(const AudioPlayerState(
          isLoading: false,
          isPlaying: false,
        )) {
    init();
  }

  void init() {
    onlineAudioPlayer.processingStateStream.listen((processingState) {
      final isLoading = processingState == ProcessingState.buffering ||
          processingState == ProcessingState.loading;

      state = state.copyWith(isLoading: isLoading);
    });

    onlineAudioPlayer.playingStream.listen((isPlaying) {
      state = state.copyWith(
        isPlaying: isPlaying,
      );
    });
  }

  void onPlay(Item item) {
    state = state.copyWith(isLoading: true);

    onlineAudioPlayer.onInitSource(item);
  }

  void onPause() {
    onlineAudioPlayer.pause();
  }
}

final audioOnlinePlayerProvider = StateNotifierProvider.family<
    AudioOnlinePlayerNotifier, AudioPlayerState, String>((ref, id) {
  return AudioOnlinePlayerNotifier();
});
