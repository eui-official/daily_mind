import 'package:daily_mind/common_domains/audio_offline_item.dart';
import 'package:daily_mind/constants/offline_audio_items.dart';

extension StringExt on String {
  AudioOfflineItem get offlineAudioItem =>
      offlineAudioItems.firstWhere((item) => item.id == this);

  List<String> get toMapLocale => split("-");
}
