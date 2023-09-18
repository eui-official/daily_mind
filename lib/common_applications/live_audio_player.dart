import 'package:just_audio/just_audio.dart';

class LiveAudioPlayer {
  final audioPlayer = AudioPlayer();

  void play(String url) async {
    await audioPlayer.setUrl(url);
    await audioPlayer.play();
  }

  void stop() async {
    await audioPlayer.stop();
  }
}

final liveAudioPlayer = LiveAudioPlayer();
