import 'dart:math';

import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/constants/offline_audio_sources.dart';
import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer extends AudioPlayer {
  late List<AudioSource> children;

  Future<void> onSetSource(String id) async {
    try {
      children = [];
      final paths = offlineAudioSources[id] ?? [];

      for (var path in paths) {
        children.add(AudioSource.asset(path));
      }

      final source = ConcatenatingAudioSource(children: children);

      final initialIndex = Random().nextInt(children.length);

      await setLoopMode(LoopMode.all);

      await setAudioSource(
        source,
        initialIndex: initialIndex,
        initialPosition: Duration.zero,
      );
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onDispose() async {
    await stop();
    await dispose();
  }
}
