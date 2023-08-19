import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer {
  final player = AudioPlayer();
  late List<AudioSource> children;

  void setSource(String path) {
    children = [
      AudioSource.asset(path),
      AudioSource.asset(path),
      AudioSource.asset(path),
    ];
  }

  void play() async {
    final playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      shuffleOrder: DefaultShuffleOrder(),
      children: children,
    );

    await player.setAudioSource(
      playlist,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );

    await player.play();
  }

  void stop() async {
    await player.stop();
  }
}
