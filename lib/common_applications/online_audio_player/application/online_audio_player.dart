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

  Future<void> onInitSource(
    List<Item> items, {
    LoopMode loopMode = LoopMode.all,
  }) async {
    try {
      final newItems = List<Item>.from(items);
      final playItem = newItems.removeAt(0);
      final newList = [...newItems, playItem];
      final initialIndex = newList.indexOf(playItem);

      onSetAudioSource(newList, initialIndex: initialIndex);
    } catch (error) {
      logger.e(error);
    }
  }

  void onSetAudioSource(
    List<Item> newList, {
    int initialIndex = 0,
  }) async {
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

  void onSeekNext() async {
    final currentItems = previousItems;
    final playItem = currentItems.removeAt(0);
    final newList = [...currentItems, playItem];
    final initialIndex = newList.indexOf(playItem);

    onSetAudioSource(newList, initialIndex: initialIndex);
  }

  void onSeekPrevious() async {
    final currentItems = previousItems;
    final lastItem = currentItems.removeLast();

    final newList = [lastItem, ...currentItems];

    onSetAudioSource(newList, initialIndex: indexState.lastIndex);
  }
}
