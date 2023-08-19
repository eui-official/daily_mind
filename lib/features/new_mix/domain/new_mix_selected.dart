import 'package:daily_mind/features/favorite_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/favorite_sounds/domain/sound_card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/utils.dart';

part 'new_mix_selected.freezed.dart';

@freezed
class NewMixSelected with _$NewMixSelected {
  const NewMixSelected._();

  const factory NewMixSelected({
    required String selectingId,
    required List<String> ids,
  }) = _NewMixSelected;

  bool get isSelecting => selectingId.isNotEmpty;

  bool get isNoSound => ids.isEmpty;

  SoundItem? get soundItem =>
      soundItems.firstWhereOrNull((item) => item.id == selectingId);
}
