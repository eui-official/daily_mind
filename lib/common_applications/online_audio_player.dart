import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer {
  final player = AudioPlayer();

  Future<void> onInitSource(String source,
      [LoopMode loopMode = LoopMode.all]) async {
    final audioSource = LockCachingAudioSource(Uri.parse(source));
    await player.setAudioSource(audioSource);
    await player.setLoopMode(loopMode);
    await player.play();
  }

  void onStop() async {
    await player.stop();
  }
}
