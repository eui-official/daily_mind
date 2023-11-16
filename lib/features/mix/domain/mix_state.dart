import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_state.freezed.dart';

@freezed
class MixState with _$MixState {
  const MixState._();

  const factory MixState({
    required String title,
    required List<MixItem> mixItems,
  }) = _MixState;

  bool isContain(String id) {
    if (isNoAudio) {
      return false;
    }

    final item = mixItems.where((state) => state.audio.id == id);

    return item.isNotEmpty;
  }

  bool get isNoAudio => mixItems.isEmpty;
}
