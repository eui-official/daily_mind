import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/constants/offline_audios.dart';

extension StringExt on String {
  OfflineAudio get onGetOfflineAudio {
    final offlineAudios = kOfflineAudioCategories
        .map((category) => category.offlineAudios)
        .flattened
        .toList();

    return offlineAudios.firstWhere((item) => item.id == this);
  }

  List<String> get toMapLocale => split("-");
}
