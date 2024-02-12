import 'package:daily_mind/common_domains/offline_audio.dart';

class OfflineAudioCategory {
  final String id;
  final String title;
  final List<OfflineAudio> offlineAudios;

  OfflineAudioCategory({
    required this.id,
    required this.title,
    required this.offlineAudios,
  });
}
