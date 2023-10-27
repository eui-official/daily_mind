import 'package:collection/collection.dart';
import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/common_applications/online_audio_player/domain/online_audio_player_index_state.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer extends AudioPlayer {
  Future<void> onInitSource(
    Item item, {
    List<Item> items = const [],
    LoopMode loopMode = LoopMode.all,
  }) async {
    try {
      onSetAudioSource(items);
    } catch (error) {
      logger.e(error);
    }
  }

  OnlineAudioPlayerIndexState get indexState {
    int index = currentIndex ?? 0;
    int sequenceLength = sequence?.length ?? 0;

    return OnlineAudioPlayerIndexState(
      index: index,
      sequenceLength: sequenceLength,
    );
  }

  List<Item> get previousItems {
    final currentSequence = sequence ?? [];

    return currentSequence.map((s) => s.tag as Item).toList();
  }

  void onSetAudioSource(
    List<Item> items, {
    int initialIndex = 0,
  }) async {
    final initialItem = items[initialIndex];

    final subEndIndex = initialIndex + 1;
    final beginItems = items.sublist(0, subEndIndex);
    final endItems = items.whereNot((element) {
      return beginItems.contains(element);
    }).toList();

    final newList = [...endItems, ...beginItems];

    final initialItemIndex = newList.indexOf(initialItem);

    final fullAudioSources = newList
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
      initialIndex: initialItemIndex,
    );

    await play();
  }

  void onSeekToIndex(int index) async {}

  void onSeekNext() async {
    final currentItems = previousItems;
    final beginItem = currentItems.removeAt(0);
    final newList = [...currentItems, beginItem];
    final initialIndex = newList.indexOf(beginItem);

    final fullAudioSources = newList
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
      initialIndex: initialIndex,
    );

    await play();
  }

  void onSeekPrevious() async {
    final currentItems = previousItems;
    final lastItem = currentItems.removeLast();

    final newList = [lastItem, ...currentItems];

    final fullAudioSources = newList
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
      initialIndex: indexState.lastIndex,
    );

    await play();
  }
}
