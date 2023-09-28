import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:daily_mind/features/mix_editor/domain/mix_editor_state.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixEditorNotifier extends StateNotifier<MixEditorState> {
  final List<SelectingState> selectingStates;

  MixEditorNotifier({
    required this.selectingStates,
  }) : super(const MixEditorState(itemStates: [])) {
    init();
  }

  void init() {
    final itemStates = selectingStates
        .map(
          (state) => MixEditorItemState(
            id: state.sound.id,
            volume: 0.5,
          ),
        )
        .toList();

    state = state.copyWith(itemStates: itemStates);
  }

  void onItemVolumeChanged(MixEditorItemState itemState, double volume) {
    final index =
        state.itemStates.indexWhere((item) => item.id == itemState.id);
    final newItemState = itemState.copyWith(volume: volume);

    final newItemStates = List<MixEditorItemState>.from(state.itemStates);
    newItemStates[index] = newItemState;

    state = state.copyWith(itemStates: newItemStates);
  }

  void addANewMix() {
    db.addANewMix(state.itemStates);
  }
}

final mixEditorProvider = StateNotifierProvider.family<MixEditorNotifier,
    MixEditorState, List<SelectingState>>((ref, selectingStates) {
  return MixEditorNotifier(selectingStates: selectingStates);
});
