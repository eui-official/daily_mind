import 'package:freezed_annotation/freezed_annotation.dart';

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
}
