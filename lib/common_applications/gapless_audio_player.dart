import 'dart:math';

import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/features/new_mix/constant/sounds.dart';
import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer {
  final audioPlayer = AudioPlayer();

  late List<AudioSource> children;

  Stream<bool> get playingStream => audioPlayer.playingStream;

  bool get isPlaying => audioPlayer.playing;

  void setSource(String id) async {
    children = [];
    final paths = sounds[id] ?? [];

    for (var path in paths) {
      children.add(AudioSource.asset(path));
    }

    final playlist = ConcatenatingAudioSource(
      shuffleOrder: DefaultShuffleOrder(),
      children: children,
    );

    final initialIndex = Random().nextInt(children.length);

    await audioPlayer.setAudioSource(
      playlist,
      initialIndex: initialIndex,
      initialPosition: Duration.zero,
    );
  }

  void play() async {
    try {
      await audioPlayer.setLoopMode(LoopMode.all);
    } catch (error) {
      logger.e(error);
    }

    await audioPlayer.play();
  }

  void stop() async {
    await audioPlayer.stop();
  }

  void setVolume(double volume) async {
    await audioPlayer.setVolume(volume);
  }

  void dispose() async {
    await audioPlayer.dispose();
  }
}
