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

  void onSelected(dynamic data) {
    if (state.selectingId == data.id) {
      onResetSelectingId();
    } else {
      state = state.copyWith(selectingId: data.id);
    }
  }

  void onDeleted(dynamic id) {
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
