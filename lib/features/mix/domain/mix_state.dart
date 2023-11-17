import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/mix/application/mix.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_state.freezed.dart';

@freezed
class MixState with _$MixState {
  const MixState._();

  const factory MixState({
    required String title,
    required List<MixItem> mixItems,
    Playlist? recentPlaylist,
  }) = _MixState;

  bool isContain(String id) {
    if (isNoAudio) {
      return false;
    }

    final item = mixItems.where((state) => state.audio.id == id);

    return item.isNotEmpty;
  }

  bool get isNoAudio => mixItems.isEmpty;

  bool get isCanAddANewMix {
    if (isNoAudio) {
      return false;
    }

    return onComplareMix(title, playlist, recentPlaylist);
  }

  Playlist get playlist {
    final items = mixItems.map((item) {
      final audio = item.audio;
      final player = item.player;

      return MixItemInfo()
        ..id = audio.id
        ..volume = player.volume;
    }).toList();

    return Playlist()
      ..title = title
      ..items = items;
  }
}
