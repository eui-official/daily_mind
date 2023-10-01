import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer {
  final player = AudioPlayer();

  Future<void> onInitSource(String source,
      [LoopMode loopMode = LoopMode.all]) async {
    final audioSource = LockCachingAudioSource(Uri.parse(source));
    await player.setAudioSource(audioSource);
    await player.setLoopMode(loopMode);
  }

  void onPlay() async {
    await player.play();
  }

  void onPause() async {
    await player.pause();
  }

  void onDispose() async {
    await player.dispose();
  }
}
