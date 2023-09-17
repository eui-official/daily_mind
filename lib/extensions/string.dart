import 'package:daily_mind/common_domains/sound_offline_item.dart';
import 'package:daily_mind/constants/sound_items.dart';

extension StringExt on String {
  SoundOfflineItem get soundOfflineItem =>
      soundOfflineItems.firstWhere((item) => item.id == this);

  List<String> get toMapLocale => split("-");
}
