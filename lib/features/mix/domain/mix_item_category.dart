import 'package:daily_mind/common_domains/audio_offline_category.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';

class MixItemCategory {
  final AudioOfflineCategory category;
  final List<MixItem> mixItems;

  MixItemCategory({
    required this.category,
    required this.mixItems,
  });
}
