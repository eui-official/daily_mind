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
    init();
  }

  void init() {
    gaplessAudioPlayer.audioPlayer.processingStateStream
        .listen((processingState) {
      final isLoading = processingState == ProcessingState.buffering ||
          processingState == ProcessingState.loading;

      state = state.copyWith(isLoading: isLoading);
    });

    gaplessAudioPlayer.audioPlayer.playingStream.listen((isPlaying) {
      state = state.copyWith(isPlaying: isPlaying);
    });
  }

  void play(String id) {
    state = state.copyWith(isLoading: true);

    gaplessAudioPlayer.setSource(id);
    gaplessAudioPlayer.play();
  }

  void stop() {
    gaplessAudioPlayer.stop();
  }
}

final audioOfflinePlayerProvider = StateNotifierProvider.family<
    AudioOfflinePlayerNotifier, AudioPlayerState, String>((ref, id) {
  return AudioOfflinePlayerNotifier();
});
