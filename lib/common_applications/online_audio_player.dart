import 'package:daily_mind/common_applications/logger.dart';
import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer {
  final player = AudioPlayer();

  Future<void> onInitSource(
    String source, [
    LoopMode loopMode = LoopMode.all,
  ]) async {
    try {
      final audioSource = LockCachingAudioSource(Uri.parse(source));
      await player.setAudioSource(audioSource);
      await player.setLoopMode(loopMode);
    } catch (error) {
      logger.e(error);
    }
  }

  void onSeek(Duration position) async {
    await player.seek(position);
  }

  void onPlay() {
    player.play();
  }

  void onPause() async {
    await player.pause();
  }

  void onDispose() async {
    await player.dispose();
  }
}
