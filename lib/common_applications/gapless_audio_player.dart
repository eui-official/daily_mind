import 'dart:math';

import 'package:daily_mind/features/new_mix/constant/sounds.dart';
import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer extends AudioPlayer {
  late List<AudioSource> children;

  void onSetSource(String id) async {
    children = [];
    final paths = sounds[id] ?? [];

    for (var path in paths) {
      children.add(AudioSource.asset(path));
    }

    final concatenatingAudioSource = ConcatenatingAudioSource(
      children: children,
    );

    final initialIndex = Random().nextInt(children.length);

    await setLoopMode(LoopMode.all);

    await setAudioSource(
      concatenatingAudioSource,
      initialIndex: initialIndex,
      initialPosition: Duration.zero,
    );
  }
}
