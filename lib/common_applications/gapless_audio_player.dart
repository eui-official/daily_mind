import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/constant/sounds.dart';
import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer {
  final audioPlayer = AudioPlayer();
  late List<AudioSource> children;

  Stream<bool> get playingStream => audioPlayer.playingStream;

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

      await audioPlayer.setAudioSource(
        playlist,
        initialIndex: 0,
        initialPosition: Duration.zero,
      );
    }
  }

  void play() async {
    await audioPlayer.play();
  }

  void stop() async {
    await audioPlayer.stop();
  }

  void setVolume(double volume) async {
    await audioPlayer.setVolume(volume);
  }
}
