import 'package:daily_mind/features/new_mix/constant/network_type.dart';
import 'package:daily_mind/features/new_mix/domain/new_mix_state.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initSelectingState = SelectingState(
  sound: null,
  networkType: NetworkType.offline,
);

const initNewMixState = NewMixState(
  selectedStates: [],
  selectingState: initSelectingState,
);

class NewMixdNotifier extends StateNotifier<NewMixState> {
  NewMixdNotifier() : super(initNewMixState);

  dynamic getSoundItem() {
    return state.selectingState.sound;
  }

  void onSelecting(SelectingState newSelectingState) {
    if (state.selectingState == newSelectingState) {
      onResetSelectingId();
    } else {
      state = state.copyWith(selectingState: newSelectingState);
    }
  }

  void onDeleted(String id) {
    final cloneSelectingStates =
        List<SelectingState>.from(state.selectedStates);
    cloneSelectingStates.removeWhere((element) => element.sound.id == id);

    state = state.copyWith(selectedStates: cloneSelectingStates);
  }

  void onResetSelectingId() {
    state = state.copyWith(selectingState: initSelectingState);
  }

  void onAddCurrentId() {
    final newSelectedStates = List<SelectingState>.from(state.selectedStates);
    newSelectedStates.add(state.selectingState);

    state = state.copyWith(selectedStates: newSelectedStates);

    onResetSelectingId();
  }
}

final newMixProvider =
    StateNotifierProvider<NewMixdNotifier, NewMixState>((ref) {
  return NewMixdNotifier();
});
