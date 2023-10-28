import 'package:collection/collection.dart';
import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/common_applications/online_audio_player/domain/online_audio_player_index_state.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:just_audio/just_audio.dart';

class OnlineAudioPlayer extends AudioPlayer {
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

  void onInitSource(List<Item> items) {
    final newItems = List<Item>.from(items);
    final playItem = newItems.removeAt(0);
    final newList = [...newItems, playItem];
    final initialIndex = newList.indexOf(playItem);

    onSetAudioSource(newList, initialIndex: initialIndex);
  }

  void onSetAudioSource(
    List<Item> newList, {
    int initialIndex = 0,
    LoopMode loopMode = LoopMode.one,
  }) async {
    try {
      await pause();

      final children = newList
          .map(
            (item) => LockCachingAudioSource(
              Uri.parse(item.source),
              tag: item,
            ),
          )
          .toList();

      final source = ConcatenatingAudioSource(children: children);

      await setAudioSource(
        source,
        initialIndex: initialIndex,
      );

      await setLoopMode(loopMode);

      await play();
    } catch (error) {
      logger.e(error);
    }
  }

  void onSeekToIndex(int index) async {
    final currentItems = previousItems;
    final topItems = currentItems.sublist(0, index);
    final restItems = currentItems.whereNot((element) {
      return topItems.contains(element);
    }).toList();
    final playItem = restItems.removeAt(0);
    final newList = [...restItems, ...topItems, playItem];
    final initialIndex = newList.indexOf(playItem);

    onSetAudioSource(newList, initialIndex: initialIndex);
  }

  void onSeekNext() {
    final currentItems = previousItems;
    final playItem = currentItems.removeAt(0);
    final newList = [...currentItems, playItem];
    final initialIndex = newList.indexOf(playItem);

    onSetAudioSource(newList, initialIndex: initialIndex);
  }

  void onSeekPrevious() {
    final currentItems = previousItems;
    final lastItem = currentItems.removeLast();

    final newList = [lastItem, ...currentItems];

    onSetAudioSource(newList, initialIndex: indexState.lastIndex);
  }
}
