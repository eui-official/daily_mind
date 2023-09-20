import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/domain/new_mix_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixdNotifier extends StateNotifier<NewMixState> {
  NewMixdNotifier()
      : super(
          const NewMixState(
            selectedIds: [],
            selectingId: emptyString,
          ),
        );

  void onSelected(String id) {
    if (state.selectingId == id) {
      onResetSelectingId();
    } else {
      state = state.copyWith(selectingId: id);
    }
  }

  void onDeleted(String id) {
    final cloneSelectedIds = List<String>.from(state.selectedIds);
    cloneSelectedIds.remove(id);

    state = state.copyWith(selectedIds: cloneSelectedIds);
  }

  void onResetSelectingId() {
    state = state.copyWith(selectingId: emptyString);
  }

  void onAddCurrentId() {
    final newSelectedIds = List<String>.from(state.selectedIds);
    newSelectedIds.add(state.selectingId);

    state = state.copyWith(selectedIds: newSelectedIds);

    onResetSelectingId();
  }
}

final newMixProvider =
    StateNotifierProvider<NewMixdNotifier, NewMixState>((ref) {
  return NewMixdNotifier();
});
