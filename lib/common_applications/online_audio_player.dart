import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer {
  final audioPlayer = AudioPlayer();

  void play(String source) async {
    final audioSource = LockCachingAudioSource(Uri.parse(source));
    await audioPlayer.setAudioSource(audioSource);
    await audioPlayer.setLoopMode(LoopMode.all);
    await audioPlayer.play();
  }

  void stop() async {
    await audioPlayer.stop();
  }
}
