import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:daily_mind/features/mix_editor/domain/mix_editor_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixEditorNotifier extends StateNotifier<MixEditorState> {
  final List<String> ids;

  MixEditorNotifier({
    required this.ids,
  }) : super(const MixEditorState(items: [])) {
    init();
  }

  void init() {
    final items = ids
        .map(
          (id) => MixEditorItemState(
            id: id,
            volume: 0.5,
          ),
        )
        .toList();

    state = state.copyWith(items: items);
  }

  void onItemVolumeChanged(MixEditorItemState itemState, double volume) {
    final index = state.items.indexWhere((item) => item.id == itemState.id);
    final newItemState = itemState.copyWith(volume: volume);

    final newItems = List<MixEditorItemState>.from(state.items);
    newItems[index] = newItemState;

    state = state.copyWith(items: newItems);
  }
}

final mixEditorProvider = StateNotifierProvider.family<MixEditorNotifier,
    MixEditorState, List<String>>((ref, ids) {
  return MixEditorNotifier(ids: ids);
});
