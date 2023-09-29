import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/offline_mix_editor/domain/offline_mix_editor_item_state.dart';
import 'package:daily_mind/features/offline_mix_editor/domain/offline_mix_editor_state.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineMixEditorNotifier extends StateNotifier<OfflineMixEditorState> {
  final List<SelectingState> selectingStates;

  OfflineMixEditorNotifier({
    required this.selectingStates,
  }) : super(const OfflineMixEditorState(offlineMixEditorItemStates: [])) {
    onInit();
  }

  void onInit() {
    final offlineMixEditorItemStates = selectingStates
        .map(
          (state) => OfflineMixEditorItemState(
            id: state.sound.id,
            volume: 0.5,
          ),
        )
        .toList();

    state =
        state.copyWith(offlineMixEditorItemStates: offlineMixEditorItemStates);
  }

  void onItemVolumeChanged(OfflineMixEditorItemState itemState, double volume) {
    final index = state.offlineMixEditorItemStates
        .indexWhere((item) => item.id == itemState.id);
    final newItemState = itemState.copyWith(volume: volume);

    final newItemStates =
        List<OfflineMixEditorItemState>.from(state.offlineMixEditorItemStates);
    newItemStates[index] = newItemState;

    state = state.copyWith(offlineMixEditorItemStates: newItemStates);
  }

  void addANewMix() {
    db.onAddANewOfflineMix(state.offlineMixEditorItemStates);
  }
}

final mixEditorProvider = StateNotifierProvider.family<OfflineMixEditorNotifier,
    OfflineMixEditorState, List<SelectingState>>((ref, selectingStates) {
  return OfflineMixEditorNotifier(selectingStates: selectingStates);
});
