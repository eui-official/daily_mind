import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer {
  final player = AudioPlayer();

  Future<void> onInitSource(
    Item item, {
    List<Item> fullItems = const [],
    LoopMode loopMode = LoopMode.all,
  }) async {
    try {
      final fullAudioSources = fullItems
          .map(
            (item) => LockCachingAudioSource(
              Uri.parse(item.source),
              tag: item,
            ),
          )
          .toList();

      final concatenatingAudioSource = ConcatenatingAudioSource(
        children: fullAudioSources,
      );

      await player.setLoopMode(loopMode);

      await player.setAudioSource(
        concatenatingAudioSource,
        initialIndex: fullItems.indexOf(item),
        initialPosition: Duration.zero,
      );
    } catch (error) {
      logger.e(error);
    }
  }

  void onSeek(Duration position) async {
    await player.seek(position);
  }

  void onPlay() {
    player.play();
  }

  void onPause() async {
    await player.pause();
  }

  void onDispose() async {
    await player.dispose();
  }
}
