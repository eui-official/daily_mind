import 'dart:math';

import 'package:daily_mind/features/new_mix/constant/sounds.dart';
import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer {
  final player = AudioPlayer();

  late List<AudioSource> children;

  Stream<bool> get playingStream => player.playingStream;

  bool get isPlaying => player.playing;

  void onSetSource(String id) async {
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

    await player.setAudioSource(
      playlist,
      initialIndex: initialIndex,
      initialPosition: Duration.zero,
    );
  }

  void onPlay() async {
    await player.setLoopMode(LoopMode.all);

    player.play();
  }

  void onPause() async {
    await player.pause();
  }

  void onSetVolume(double volume) async {
    await player.setVolume(volume);
  }

  void onDispose() async {
    await player.dispose();
  }
}
