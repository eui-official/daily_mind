import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_providers/domain/audio_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioOfflinePlayerNotifier extends StateNotifier<AudioPlayerState> {
  GaplessAudioPlayer gaplessAudioPlayer = GaplessAudioPlayer();

  AudioOfflinePlayerNotifier()
      : super(const AudioPlayerState(
          isLoading: false,
          isPlaying: false,
        )) {
    onInit();
  }

  void onInit() {
    gaplessAudioPlayer.player.processingStateStream.listen((processingState) {
      final isLoading = processingState == ProcessingState.buffering ||
          processingState == ProcessingState.loading;

      state = state.copyWith(isLoading: isLoading);
    });

    gaplessAudioPlayer.player.playingStream.listen((isPlaying) {
      state = state.copyWith(isPlaying: isPlaying);
    });
  }

  void onPlay(String id) {
    state = state.copyWith(isLoading: true);

    gaplessAudioPlayer.onSetSource(id);
    gaplessAudioPlayer.onPlay();
  }

  void onPause() {
    gaplessAudioPlayer.onPause();
  }
}

final audioOfflinePlayerProvider = StateNotifierProvider.family<
    AudioOfflinePlayerNotifier, AudioPlayerState, String>((ref, id) {
  return AudioOfflinePlayerNotifier();
});
