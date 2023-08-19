import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_mix_selected.freezed.dart';

@freezed
class NewMixSelected with _$NewMixSelected {
  const factory NewMixSelected({
    required List<String> ids,
  }) = _NewMixSelected;
}
