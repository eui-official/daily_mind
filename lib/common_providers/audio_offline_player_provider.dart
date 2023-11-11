import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_providers/domain/audio_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

const initState = AudioPlayerState(
  isLoading: false,
  isPlaying: false,
);

class AudioOfflinePlayerNotifier extends StateNotifier<AudioPlayerState> {
  GaplessAudioPlayer offlineGaplessAudioPlayer = GaplessAudioPlayer();

  AudioOfflinePlayerNotifier() : super(initState) {
    onInit();
  }

  void onInit() {
    offlineGaplessAudioPlayer.processingStateStream.listen((processingState) {
      final isLoading = processingState == ProcessingState.buffering ||
          processingState == ProcessingState.loading;

      if (mounted) {
        state = state.copyWith(isLoading: isLoading);
      }
    });

    offlineGaplessAudioPlayer.playingStream.listen((isPlaying) {
      if (mounted) {
        state = state.copyWith(isPlaying: isPlaying);
      }
    });
  }

  void onPlay(String id) async {
    state = state.copyWith(isLoading: true);

    await offlineGaplessAudioPlayer.onSetSource(id);

    offlineGaplessAudioPlayer.play();
  }

  void onPause() {
    offlineGaplessAudioPlayer.pause();
  }

  @override
  void dispose() {
    offlineGaplessAudioPlayer.onDispose();
    super.dispose();
  }
}

final audioOfflinePlayerProvider = StateNotifierProvider.autoDispose
    .family<AudioOfflinePlayerNotifier, AudioPlayerState, String>((ref, id) {
  return AudioOfflinePlayerNotifier();
});
