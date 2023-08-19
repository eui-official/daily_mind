import 'package:daily_mind/features/new_mix/domain/new_mix_selected.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixSelectedNotifier extends StateNotifier<NewMixSelected> {
  NewMixSelectedNotifier() : super(const NewMixSelected(ids: []));

  void addNewId(String id) {
    final newIds = List<String>.from(state.ids);
    newIds.add(id);

    state = state.copyWith(ids: newIds);
  }
}

final newMixSelectedProvider =
    StateNotifierProvider<NewMixSelectedNotifier, NewMixSelected>((ref) {
  return NewMixSelectedNotifier();
});
