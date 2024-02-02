import 'package:daily_mind/constants/offline_audios.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix/domain/mix_item_category.dart';

extension MixItemsExt on List<MixItem> {
  bool get isNoAudio => isEmpty;

  bool isContain(String id) {
    if (isNoAudio) {
      return false;
    }

    final items = where((item) => item.audio.id == id);

    return items.isNotEmpty;
  }

  List<MixItemCategory> get toGetMixItemCategories {
    if (isNoAudio) {
      return [];
    }

    final itemCategories = <MixItemCategory>[];

    forEach((item) {
      final audioCategory = kOfflineAudioCategories.firstWhere(
        (audioCategory) {
          return audioCategory.audios.contains(item.audio);
        },
      );

      final itemCategory = itemCategories.firstWhere(
        (itemCategory) {
          return itemCategory.category == audioCategory;
        },
        orElse: () => MixItemCategory(
          category: audioCategory,
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
