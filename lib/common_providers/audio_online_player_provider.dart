import 'package:daily_mind/common_applications/youtube_audio_player.dart';
import 'package:daily_mind/common_providers/domain/audio_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioOnlinePlayerNotifier extends StateNotifier<AudioPlayerState> {
  final youtubeAudioPlayer = YoutubeAudioPlayer();

  AudioOnlinePlayerNotifier()
      : super(const AudioPlayerState(
          isLoading: false,
          isPlaying: false,
        )) {
    init();
  }

  void init() {
    youtubeAudioPlayer.audioPlayer.processingStateStream
        .listen((processingState) {
      final isLoading = processingState == ProcessingState.buffering ||
          processingState == ProcessingState.loading;

      state = state.copyWith(isLoading: isLoading);
    });

    youtubeAudioPlayer.audioPlayer.playingStream.listen((isPlaying) {
      state = state.copyWith(
        isPlaying: isPlaying,
      );
    });
  }

  void play(String source) {
    state = state.copyWith(isLoading: true);

    youtubeAudioPlayer.play(source);
  }

  void stop() {
    youtubeAudioPlayer.stop();
  }
}

final audioOnlinePlayerProvider = StateNotifierProvider.family<
    AudioOnlinePlayerNotifier, AudioPlayerState, String>((ref, id) {
  return AudioOnlinePlayerNotifier();
});
