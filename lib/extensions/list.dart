import 'package:daily_mind/constants/offline_audios.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix/domain/mix_item_category.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';

extension MixItemsExt on List<MixItem> {
  bool get isNoAudio => isEmpty;

  bool isContain(String id) {
    if (isNoAudio) {
      return false;
    }

    final items = where((item) => item.offlineAudio.id == id);

    return items.isNotEmpty;
  }

  List<MixItemCategory> get toGetMixItemCategories {
    if (isNoAudio) {
      return [];
    }

    final itemCategories = <MixItemCategory>[];

    forEach((item) {
      final offlineAudioCategory = kOfflineAudioCategories.firstWhere(
        (audioCategory) {
          return audioCategory.offlineAudios.contains(item.offlineAudio);
        },
      );

      final itemCategory = itemCategories.firstWhere(
        (itemCategory) {
          return itemCategory.offlineAudioCategory == offlineAudioCategory;
        },
        orElse: () => MixItemCategory(
          offlineAudioCategory: offlineAudioCategory,
          mixItems: [],
        ),
      );

      itemCategory.mixItems.add(item);

      if (!itemCategories.contains(itemCategory)) {
        itemCategories.add(itemCategory);
      }
    });

    return itemCategories;
  }
}

extension WakeUpTimes on List<WakeUpTime> {
  int onGetWakeUpTimeIndex(WakeUpTime time) {
    return indexWhere((element) {
      final isMatchStartTime = element.startTime.hour == time.startTime.hour &&
          element.startTime.minute == time.startTime.minute;
      final isMatchEndTime = element.endTime.hour == time.endTime.hour &&
          element.endTime.minute == time.endTime.minute;

      return isMatchStartTime && isMatchEndTime;
    });
  }
}
