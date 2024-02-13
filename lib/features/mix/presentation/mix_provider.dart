import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/mix_collection.dart';
import 'package:daily_mind/extensions/list.dart';
import 'package:daily_mind/features/mix/application/mix.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix/domain/mix_state.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initMixState = MixState(title: kEmptyString);

class MixdNotifier extends StateNotifier<MixState> {
  final BaseMiniPlayerProvider baseMiniPlayerNotifier;
  final DailyMindBackgroundHandler baseBackgroundHandler;
  final OnlinePlayerNotifier onlinePlayerNotifier;

  MixdNotifier({
    required this.baseMiniPlayerNotifier,
    required this.baseBackgroundHandler,
    required this.onlinePlayerNotifier,
  }) : super(initMixState);

  List<MixItem> get mixItems => baseBackgroundHandler.mixItems;

  MixCollection get mixCollection {
    final items = mixItems.map((item) {
      final offlineAudio = item.offlineAudio;
      final player = item.player;

      return MixCollectionItemInfo()
        ..id = offlineAudio.id
        ..volume = player.volume;
    }).toList();

    return MixCollection()
      ..title = state.title
      ..items = items;
  }

  bool get isCanAddANewMix {
    if (mixItems.isNoAudio) {
      return false;
    }

    return onComplareMix(
      state.title,
      mixCollection,
      state.recentMixCollection,
    );
  }

  Future<void> onAddNewMix() async {
    final id = await db.onAddNewMixCollection(mixCollection);

    final recentMixCollection = db.onGetMixCollectionById(id);
    state = state.copyWith(recentMixCollection: recentMixCollection);
  }

  void onDeleteMix() {
    final recentMixCollectionId = state.recentMixCollection?.id;

    if (recentMixCollectionId != null) {
      db.onDeleteCollection(recentMixCollectionId);

      state = state.copyWith(recentMixCollection: kNull);
    }
  }

  void onSelect(OfflineAudio offlineAudio) async {
    onlinePlayerNotifier.onReset();

    if (mixItems.isContain(offlineAudio.id)) {
      final item = mixItems.firstWhere(
        (item) => item.offlineAudio.id == offlineAudio.id,
      );

      baseBackgroundHandler.onRemoveMixItem(item);
    } else {
      final newMixItem = MixItem(
        offlineAudio: offlineAudio,
        player: GaplessAudioPlayer(),
      );

      await baseBackgroundHandler.onAddMixItem(newMixItem);
    }

    baseMiniPlayerNotifier.onUpdateState(
      MiniPlayerState(
        isShow: mixItems.isNotEmpty,
        audioType: AudioTypes.mix,
      ),
    );
  }

  void onClearTitle() {
    state = state.copyWith(title: kEmptyString);
  }

  void onUpdateTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }
}

final mixProvider = StateNotifierProvider<MixdNotifier, MixState>((ref) {
  final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);
  final baseBackgroundHandler = ref.read(baseBackgroundHandlerProvider);
  final onlinePlayerNotifier = ref.read(onlinePlayerNotifierProvider.notifier);

  return MixdNotifier(
    baseMiniPlayerNotifier: baseMiniPlayerNotifier,
    baseBackgroundHandler: baseBackgroundHandler,
    onlinePlayerNotifier: onlinePlayerNotifier,
  );
});
