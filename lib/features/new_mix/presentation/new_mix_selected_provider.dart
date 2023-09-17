import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/sound_offline_item.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/domain/new_mix_selected.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixSelectedNotifier extends StateNotifier<NewMixSelected> {
  final player = GaplessAudioPlayer();

  NewMixSelectedNotifier()
      : super(
          const NewMixSelected(
            selectedIds: [],
            selectingId: emptyString,
          ),
        );

  void onSelected(dynamic data) {
    if (state.selectingId == data.id) {
      onResetSelectingId();
    } else {
      state = state.copyWith(selectingId: data.id);

      if (data is SoundOfflineItem) {
        onPlayingOfflineSound(data.id);
      }
    }
  }

  void onDeleted(dynamic data) {
    final cloneSelectedIds = List<String>.from(state.selectedIds);
    cloneSelectedIds.remove(data.id);

    state = state.copyWith(selectedIds: cloneSelectedIds);
  }

  void onResetSelectingId() {
    state = state.copyWith(selectingId: emptyString);
    player.stop();
  }

  void onPlayingOfflineSound(String id) {
    player.setSource(id);
    player.play();
  }

  void onAddCurrentId() {
    final newSelectedIds = List<String>.from(state.selectedIds);
    newSelectedIds.add(state.selectingId);

    state = state.copyWith(selectedIds: newSelectedIds);

    onResetSelectingId();
  }
}

final newMixSelectedProvider =
    StateNotifierProvider<NewMixSelectedNotifier, NewMixSelected>((ref) {
  return NewMixSelectedNotifier();
});
