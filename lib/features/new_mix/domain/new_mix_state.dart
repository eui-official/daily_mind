import 'package:daily_mind/common_domains/sound_offline_item.dart';
import 'package:daily_mind/constants/sound_items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/utils.dart';

part 'new_mix_state.freezed.dart';

@freezed
class NewMixState with _$NewMixState {
  const NewMixState._();

  const factory NewMixState({
    required String selectingId,
    required List<String> selectedIds,
  }) = _NewMixState;

  bool get isSelecting => selectingId.isNotEmpty;

  bool get isCanAdd => isSelecting && !selectedIds.contains(selectingId);

  bool get isNoSound => selectedIds.isEmpty;

  SoundOfflineItem? get soundItem =>
      soundOfflineItems.firstWhereOrNull((item) => item.id == selectingId);
}
