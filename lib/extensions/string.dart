import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/constants/offline_audios.dart';

extension StringExt on String {
  AudioOffline get onGetOfflineAudio {
    final audios = kOfflineAudioCategories
        .map((category) => category.audios)
        .flattened
        .toList();

    return audios.firstWhere((item) => item.id == this);
  }

  List<String> get toMapLocale => split("-");
}
