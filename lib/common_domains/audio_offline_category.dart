import 'package:daily_mind/common_domains/audio_offline.dart';

class AudioOfflineCategory {
  final String id;
  final String name;
  final List<AudioOffline> audios;

  AudioOfflineCategory({
    required this.id,
    required this.name,
    required this.audios,
  });
}
