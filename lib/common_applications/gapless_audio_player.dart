import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/constant/sounds.dart';
import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer {
  final player = AudioPlayer();
  late List<AudioSource> children;

  void setSource(String id) async {
    final path = sounds[id] ?? emptyString;

    if (path.isNotEmpty) {
      children = [
        AudioSource.asset(path),
        AudioSource.asset(path),
        AudioSource.asset(path),
      ];

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
    }
  }

  void play() async {
    await player.play();
  }

  void stop() async {
    await player.stop();
  }

  void setVolume(double volume) async {
    await player.setVolume(volume);
  }
}
