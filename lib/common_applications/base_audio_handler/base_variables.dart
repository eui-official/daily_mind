import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/common_domains/mix_volume.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:rxdart/rxdart.dart';

mixin BaseAudioVariables on BaseAudioHandler {
  AudioTypes audioType = AudioTypes.none;
  bool isAutoPlayNext = true;

  OnlineAudioPlayer onlinePlayer = OnlineAudioPlayer();

  StreamSubscription<Duration?>? onStreamDuration;
  StreamSubscription<Duration>? onStreamPosition;
}

mixin BaseAudioMixVariables on BaseAudioHandler {
  BehaviorSubject<List<MixItem>> onStreamMixItems = BehaviorSubject()..add([]);

  List<MixItem> get mixItems => onStreamMixItems.value;

  bool get isMixItemsEmpty => mixItems.isEmpty;

  List<MixVolume> backupMixVolumes = [];
}

mixin BaseAudioOnHoldVariables on BaseAudioHandler {
  bool isPreviousPlaying = true;
}

mixin BaseTimer on BaseAudioHandler {
  BehaviorSubject<Duration> onStreamTimerRemaining = BehaviorSubject()
    ..add(Duration.zero);

  StreamController<double> onMasterVolumeController =
      StreamController<double>.broadcast();

  Stream get onMasterVolumeStream => onMasterVolumeController.stream;

  Duration get remainingTime => onStreamTimerRemaining.value;

  Timer? timer;
}
