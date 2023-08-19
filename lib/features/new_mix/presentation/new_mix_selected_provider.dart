import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/constant/sounds.dart';
import 'package:daily_mind/features/new_mix/domain/new_mix_selected.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class NewMixSelectedNotifier extends StateNotifier<NewMixSelected> {
  final player = AudioPlayer();

  NewMixSelectedNotifier()
      : super(
          const NewMixSelected(
            selectedIds: [],
            selectingId: emptyString,
          ),
        );

  void onSelected(String id) {
    if (state.selectingId == id) {
      onResetSelectingId();
    } else {
      state = state.copyWith(selectingId: id);
      onPlayingSound(id);
    }
  }

  void onResetSelectingId() {
    state = state.copyWith(selectingId: emptyString);
    player.stop();
  }

  void onPlayingSound(String id) {
    final soundPath = sounds[id] ?? emptyString;

    if (soundPath.isNotEmpty) {
      player.setAsset(soundPath);
      player.setLoopMode(LoopMode.all);
      player.play();
    }
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
