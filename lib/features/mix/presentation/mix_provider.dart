import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/mix/application/mix.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix/domain/mix_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initMixState = MixState(title: emptyString);

class MixdNotifier extends StateNotifier<MixState> {
  final BaseMiniPlayerProvider baseMiniPlayerNotifier;
  final DailyMindBackgroundHandler baseBackgroundHandler;

  MixdNotifier({
    required this.baseMiniPlayerNotifier,
    required this.baseBackgroundHandler,
  }) : super(initMixState);

  List<MixItem> get mixItems => baseBackgroundHandler.mixItems;

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

    return onComplareMix(
      state.title,
      playlist,
      state.recentPlaylist,
    );
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
      ..title = state.title
      ..items = items;
  }

  void onAddNewMix() async {
    final id = await db.onAddNewPlaylist(playlist);

    final recentPlaylist = db.onGetPlaylistById(id);
    state = state.copyWith(recentPlaylist: recentPlaylist);
  }

  void onDeleteMix() {
    final recentPlaylistId = state.recentPlaylist?.id;

    if (recentPlaylistId != null) {
      db.onDeletePlaylist(recentPlaylistId);
      state = state.copyWith(recentPlaylist: null);
    }
  }

  void onSelect(AudioOffline audio) {
    if (isContain(audio.id)) {
      final item = mixItems.firstWhere((item) => item.audio.id == audio.id);
      baseBackgroundHandler.onRemoveMixItem(item);
    } else {
      final newMixItem = MixItem(
        audio: audio,
        player: GaplessAudioPlayer(),
      );

      baseBackgroundHandler.onAddMixItem(newMixItem);
    }

    baseMiniPlayerNotifier.onUpdateState(
      MiniPlayerState(
        isShow: mixItems.isNotEmpty,
        audioType: AudioTypes.mix,
      ),
    );
  }

  void onUpdateTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }

  void onVolumeChanged(int index, double volume) {}
}

final mixProvider = StateNotifierProvider<MixdNotifier, MixState>((ref) {
  final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);
  final baseBackgroundHandler = ref.read(baseBackgroundHandlerProvider);

  return MixdNotifier(
    baseMiniPlayerNotifier: baseMiniPlayerNotifier,
    baseBackgroundHandler: baseBackgroundHandler,
  );
});
