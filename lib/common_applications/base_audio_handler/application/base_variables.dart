import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/base_count_down.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:rxdart/rxdart.dart';

mixin BaseAudioVariables on BaseAudioHandler {
  bool isAutoPlayNext = true;
  AudioTypes audioType = AudioTypes.none;

  List<OfflinePlayerItem> offlinePlayerItems = [];
  OnlineAudioPlayer onlinePlayer = OnlineAudioPlayer();

  BehaviorSubject<int> onStreamPlaylistId = BehaviorSubject();
  StreamSubscription<Duration?>? onStreamDuration;
  StreamSubscription<Duration>? onStreamPosition;

  Timer? timer;
}

mixin BaseAudioOnHoldVariables on BaseAudioHandler {
  bool isPreviousPlaying = true;
}

mixin BaseTaskVariables on BaseAudioHandler {
  late Pomodoro taskCurrentPomodoro;
  BaseCountdown taskCountdown = BaseCountdown();
  int taskCurrentSession = 1;

  BehaviorSubject<int> onStreamTaskRemainingSeconds = BehaviorSubject();
  BehaviorSubject<int> onStreamTaskSeconds = BehaviorSubject();
  BehaviorSubject<FocusModeSessionSteps> onStreamTaskCurrentStep =
      BehaviorSubject();

  int get workingSessions => taskCurrentPomodoro.workingSessions ?? 0;

  int get shortBreak => taskCurrentPomodoro.shortBreak ?? 0;
  int get shortBreakInSeconds => shortBreak * 1;

  int get longBreak => taskCurrentPomodoro.longBreak ?? 0;
  int get longBreakInSeconds => longBreak * 1;

  FocusModeSessionSteps get taskCurrentStep => onStreamTaskCurrentStep.value;
}
