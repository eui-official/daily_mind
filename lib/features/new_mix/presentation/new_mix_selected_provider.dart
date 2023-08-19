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
            ids: [],
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
      player.play();
    }
  }

  void onAddCurrentId() {
    final newIds = List<String>.from(state.ids);
    newIds.add(state.selectingId);

    state = state.copyWith(ids: newIds);

    onResetSelectingId();
  }
}

final newMixSelectedProvider =
    StateNotifierProvider<NewMixSelectedNotifier, NewMixSelected>((ref) {
  return NewMixSelectedNotifier();
});
