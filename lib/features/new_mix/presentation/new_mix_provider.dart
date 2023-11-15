import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/features/new_mix/domain/new_mix_state.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initSelectingState = SelectingState(
  audio: null,
  audioType: AudioTypes.offline,
);

const initNewMixState = NewMixState(
  selectedStates: [],
);

class NewMixdNotifier extends StateNotifier<NewMixState> {
  final BaseMiniPlayerProvider baseMiniPlayerNotifier;

  NewMixdNotifier({
    required this.baseMiniPlayerNotifier,
  }) : super(initNewMixState);

  void onSelect(SelectingState newSelectingState) {
    baseMiniPlayerNotifier.onUpdateState(
      const MiniPlayerState(
        isShow: true,
        audioType: AudioTypes.mix,
      ),
    );

    final newSelectedStates = List<SelectingState>.from(state.selectedStates);
    newSelectedStates.add(newSelectingState);

    state = state.copyWith(selectedStates: newSelectedStates);
  }

  // Remove selecting state from selected states, and update the state
  void onUnSelecting(SelectingState selectingState) {
    final newSelectedStates = List<SelectingState>.from(state.selectedStates);
    newSelectedStates.remove(selectingState);

    if (newSelectedStates.isEmpty) {
      baseMiniPlayerNotifier.onHide();
    }

    state = state.copyWith(selectedStates: newSelectedStates);
  }

  void onDeleted(String id) {
    final cloneSelectingStates =
        List<SelectingState>.from(state.selectedStates);
    cloneSelectingStates.removeWhere((element) => element.audio.id == id);

    state = state.copyWith(selectedStates: cloneSelectingStates);
  }
}

final newMixProvider =
    StateNotifierProvider<NewMixdNotifier, NewMixState>((ref) {
  final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

  return NewMixdNotifier(
    baseMiniPlayerNotifier: baseMiniPlayerNotifier,
  );
});
