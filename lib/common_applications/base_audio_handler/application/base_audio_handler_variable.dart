import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/base_count_down.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:rxdart/rxdart.dart';

mixin BaseAudioHandlerVariable on BaseAudioHandler {
  bool isAutoPlayNext = true;

  List<OfflinePlayerItem> offlinePlayerItems = [];
  AudioTypes audioType = AudioTypes.none;

  OnlineAudioPlayer onlinePlayer = OnlineAudioPlayer();

  BehaviorSubject<int> onStreamPlaylistId = BehaviorSubject();
  StreamSubscription<Duration?>? onStreamDuration;
  StreamSubscription<Duration>? onStreamPosition;

  BaseCountDown baseCountDown = BaseCountDown();
  BehaviorSubject<int> onStreamTaskRemainingSeconds = BehaviorSubject();
  BehaviorSubject<int> onStreamTaskTotalSeconds = BehaviorSubject();

  Timer? timer;
}
