import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/constants/offline_audios.dart';

extension StringExt on String {
  AudioOffline get onGetOfflineAudio =>
      offlineAudios.firstWhere((item) => item.id == this);

  List<String> get toMapLocale => split("-");
}
