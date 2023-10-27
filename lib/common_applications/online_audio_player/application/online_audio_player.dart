import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/common_applications/online_audio_player/domain/online_audio_player_index_state.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer extends AudioPlayer {
  List<Item> backupItems = [];

  Future<void> onInitSource(
    Item item, {
    List<Item> items = const [],
    LoopMode loopMode = LoopMode.all,
  }) async {
    try {
      onSetAudioSource(items);

      backupItems = items;
    } catch (error) {
      logger.e(error);
    }
  }

  OnlineAudioPlayerIndexState onGetIndexState() {
    int index = currentIndex ?? 0;
    int sequenceLength = sequence?.length ?? 0;

    return OnlineAudioPlayerIndexState(
      index: index,
      sequenceLength: sequenceLength,
    );
  }

  void onSetAudioSource(
    List<Item> items, {
    int initialIndex = 0,
  }) async {
    final beginItems = items.sublist(0, initialIndex);
    final restItems = items.skip(initialIndex).toList();
    final startItem = restItems.removeAt(0);

    final newItems = [...restItems, ...beginItems, startItem];
    final index = newItems.indexOf(startItem);

    final fullAudioSources = newItems
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

    await setAudioSource(
      concatenatingAudioSource,
      preload: false,
    );

    await seek(Duration.zero, index: index);

    backupItems = newItems;
  }

  void onSeekToIndex(int index) async {
    onSetAudioSource(backupItems, initialIndex: index);
  }

  void onSeekNext() {
    final indexState = onGetIndexState();

    if (indexState.isCanMoveNext) {
      onSeekToIndex(indexState.nextIndex);
    } else {
      onSeekToIndex(indexState.firstIndex);
    }
  }

  void onSeekPrevious() {
    final indexState = onGetIndexState();

    if (indexState.isCanMovePrevious) {
      onSeekToIndex(indexState.previousIndex);
    } else {
      onSeekToIndex(indexState.lastIndex);
    }
  }
}
