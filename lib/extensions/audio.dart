import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/audio_offline.dart';

extension OfflineAudiosExt on List<AudioOffline> {
  AudioOffline? getId(String? id) {
    return firstWhereOrNull((element) => element.id == id);
  }
}
