import 'package:daily_mind/common_domains/offline_audio_category.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';

class MixItemCategory {
  final OfflineAudioCategory offlineAudioCategory;
  final List<MixItem> mixItems;

  MixItemCategory({
    required this.offlineAudioCategory,
    required this.mixItems,
  });
}
