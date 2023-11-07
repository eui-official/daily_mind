import 'package:collection/collection.dart';
import 'package:daily_mind/common_applications/logger.dart';
import 'package:daily_mind/common_applications/online_audio_player/domain/online_audio_player_index_state.dart';
import 'package:daily_mind/common_domains/audio.dart';
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

  List<Audio> get previousAudios {
    final currentSequence = sequence ?? [];

    return currentSequence.map((s) => s.tag as Audio).toList();
  }

  void onInitSource(List<Audio> audios) {
    final newItems = List<Audio>.from(audios);
    final playItem = newItems.removeAt(0);
    final newList = [...newItems, playItem];
    final initialIndex = newList.indexOf(playItem);

    onSetAudioSource(newList, initialIndex: initialIndex);
  }

  void onSetAudioSource(
    List<Audio> audios, {
    int initialIndex = 0,
    LoopMode loopMode = LoopMode.one,
  }) async {
    try {
      await pause();

      final children = audios
          .map(
            (audio) => LockCachingAudioSource(
              Uri.parse(audio.source),
              tag: audio,
            ),
          )
          .toList();

      final source = ConcatenatingAudioSource(children: children);

      await setAudioSource(
        source,
        initialIndex: initialIndex,
      );

      await setLoopMode(loopMode);

      play();
    } catch (error) {
      logger.e(error);
    }
  }

  void onSeekToIndex(int index) async {
    final currentAudios = previousAudios;

    final topAudios = currentAudios.sublist(0, index);
    final restAudios = currentAudios.whereNot((element) {
      return topAudios.contains(element);
    }).toList();

    final playAudio = restAudios.removeAt(0);
    final audios = [...restAudios, ...topAudios, playAudio];
    final initialIndex = audios.indexOf(playAudio);

    onSetAudioSource(audios, initialIndex: initialIndex);
  }

  void onSeekNext() {
    final currentAudios = previousAudios;

    final playAudio = currentAudios.removeAt(0);
    final audios = [...currentAudios, playAudio];
    final initialIndex = audios.indexOf(playAudio);

    onSetAudioSource(audios, initialIndex: initialIndex);
  }

  void onSeekPrevious() {
    final currentItems = previousAudios;
    final lastAudio = currentItems.removeLast();

    final audios = [lastAudio, ...currentItems];

    onSetAudioSource(audios, initialIndex: indexState.lastIndex);
  }

  Future<void> onDispose() async {
    await stop();
    await dispose();
  }
}
