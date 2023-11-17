import 'package:daily_mind/features/mix/domain/mix_item.dart';

extension MixItemsExt on List<MixItem> {
  bool get isNoAudio => isEmpty;

  bool isContain(String id) {
    if (isNoAudio) {
      return false;
    }

    final items = where((item) => item.audio.id == id);

    return items.isNotEmpty;
  }
}
