import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_mix_state.freezed.dart';

@freezed
class NewMixState with _$NewMixState {
  const NewMixState._();

  const factory NewMixState({
    required SelectingState selectingState,
    required List<SelectingState> selectedStates,
  }) = _NewMixState;

  bool isContain(String id) {
    if (isNoAudio) {
      return false;
    }

    final sounds = selectedStates.where((state) => state.audio.id == id);

    return sounds.isNotEmpty;
  }

  bool get isSelecting => selectingState.audio != null;

  bool get isCanAdd => isSelecting && !selectedStates.contains(selectingState);

  bool get isNoAudio => selectedStates.isEmpty;
}
