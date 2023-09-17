import 'package:daily_mind/common_domains/sound_item.dart';
import 'package:daily_mind/constants/sound_items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/utils.dart';

part 'new_mix_selected.freezed.dart';

@freezed
class NewMixSelected with _$NewMixSelected {
  const NewMixSelected._();

  const factory NewMixSelected({
    required String selectingId,
    required List<String> selectedIds,
  }) = _NewMixSelected;

  bool get isSelecting => selectingId.isNotEmpty;

  bool get isCanAdd => isSelecting && !selectedIds.contains(selectingId);

  bool get isNoSound => selectedIds.isEmpty;

  SoundItem? get soundItem =>
      soundItems.firstWhereOrNull((item) => item.id == selectingId);
}
