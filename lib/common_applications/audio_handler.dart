import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/assets.dart';

class DailyMindAudioHandler extends BaseAudioHandler {
  late String soundId;

  void setSoundId(String id) {
    soundId = id;
  }

  @override
  Future<void> play() async {
    final artUri = await getSoundImageFromAsset(soundId);

    mediaItem.add(
      MediaItem(
        album: 'Natural sounds',
        displayDescription: 'Natural sounds',
        id: 'dailyMind',
        title: 'DailyMind',
        artUri: artUri,
      ),
    );

    playbackState.add(
      playbackState.value.copyWith(
        queueIndex: 0,
        playing: true,
        processingState: AudioProcessingState.ready,
        repeatMode: AudioServiceRepeatMode.none,
        shuffleMode: AudioServiceShuffleMode.none,
        controls: [
          MediaControl.pause,
          MediaControl.play,
        ],
      ),
    );
  }

  @override
  Future<void> pause() async {
    playbackState.add(playbackState.value.copyWith(playing: false));
  }

  @override
  Future<void> stop() async {
    print('stop');
  }
}
