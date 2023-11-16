import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/features/mix/domain/mix_state.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initMixState = MixState(
  title: emptyString,
  mixItems: [],
);

class MixdNotifier extends StateNotifier<MixState> {
  final BaseMiniPlayerProvider baseMiniPlayerNotifier;

  MixdNotifier({
    required this.baseMiniPlayerNotifier,
  }) : super(initMixState);

  void onPlay(MixItem item) {
    final audio = item.audio;
    final player = item.player;

    player.onSetSource(audio.id);
    player.play();
  }

  void onSelect(AudioOffline audio) {
    if (state.isContain(audio.id)) {
      final currentMixItems = List<MixItem>.from(state.mixItems);

      final item =
          currentMixItems.firstWhere((item) => item.audio.id == audio.id);
      item.player.onDispose();

      currentMixItems.remove(item);

      state = state.copyWith(mixItems: currentMixItems);
    } else {
      final newMixItem = MixItem(
        audio: audio,
        player: GaplessAudioPlayer(),
      );
      final newMixItems = [...state.mixItems, newMixItem];

      onPlay(newMixItem);

      state = state.copyWith(mixItems: newMixItems);
    }

    baseMiniPlayerNotifier.onUpdateState(
      MiniPlayerState(
        isShow: state.mixItems.isNotEmpty,
        audioType: AudioTypes.mix,
      ),
    );
  }

  void onUpdateTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }
}

final mixProvider = StateNotifierProvider<MixdNotifier, MixState>((ref) {
  final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

  return MixdNotifier(
    baseMiniPlayerNotifier: baseMiniPlayerNotifier,
  );
});
