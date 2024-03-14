import 'dart:math';

import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:just_audio/just_audio.dart';

class GaplessAudioPlayer extends AudioPlayer {
  late List<AudioSource> children;

  Future<void> onSetSource(OfflineAudio offlineAudio) async {
    try {
      children = [];
      final sources = offlineAudio.sources;

      for (var source in sources) {
        children.add(AudioSource.asset(source));
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
