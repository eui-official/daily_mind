import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/new_mix/domain/new_mix_state.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initSelectingState = SelectingState(
  audio: null,
  networkType: NetworkType.offline,
);

const initNewMixState = NewMixState(
  selectedStates: [],
  selectingState: initSelectingState,
);

class NewMixdNotifier extends StateNotifier<NewMixState> {
  NewMixdNotifier() : super(initNewMixState);

  dynamic onGetAudio() {
    return state.selectingState.audio;
  }

  void onSelecting(SelectingState newSelectingState) {
    state = state.copyWith(selectingState: newSelectingState);
  }

  void onUnSelecting() {
    state = state.copyWith(selectingState: initSelectingState);
  }

  void onDeleted(String id) {
    final cloneSelectingStates =
        List<SelectingState>.from(state.selectedStates);
    cloneSelectingStates.removeWhere((element) => element.audio.id == id);

    state = state.copyWith(selectedStates: cloneSelectingStates);
  }

  void onResetSelectingId() {
    state = state.copyWith(selectingState: initSelectingState);
  }

  void onAddCurrentId() {
    final newSelectedStates = List<SelectingState>.from(state.selectedStates);
    newSelectedStates.add(state.selectingState);

    state = state.copyWith(
      selectedStates: newSelectedStates,
    );

    onResetSelectingId();
  }
}

final newMixProvider =
    StateNotifierProvider<NewMixdNotifier, NewMixState>((ref) {
  return NewMixdNotifier();
});
