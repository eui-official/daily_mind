import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/base_count_down.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:rxdart/rxdart.dart';

mixin BaseAudioVariables on BaseAudioHandler {
  AudioTypes audioType = AudioTypes.none;
  bool isAutoPlayNext = true;
  Timer? timer;

  List<OfflinePlayerItem> offlinePlayerItems = [];
  OnlineAudioPlayer onlinePlayer = OnlineAudioPlayer();

  BehaviorSubject<int> onStreamPlaylistId = BehaviorSubject();
  StreamSubscription<Duration?>? onStreamDuration;
  StreamSubscription<Duration>? onStreamPosition;
}

mixin BaseAudioOnHoldVariables on BaseAudioHandler {
  bool isPreviousPlaying = true;
}

mixin BaseTaskVariables on BaseAudioHandler {
  BaseCountdown taskCountdown = BaseCountdown();
  int taskCurrentSession = 1;
  Pomodoro taskCurrentPomodoro = Pomodoro();

  BehaviorSubject<bool> onStreamTaskPlaying = BehaviorSubject();
  BehaviorSubject<int> onStreamTaskRemainingSeconds = BehaviorSubject();
  BehaviorSubject<int> onStreamTaskSeconds = BehaviorSubject();
  BehaviorSubject<FocusModeSessionSteps> onStreamTaskCurrentStep =
      BehaviorSubject();

  bool get isShouldTakeALongBreak => taskCurrentSession % 4 == 0;
  bool get isTaskCompleting => taskCurrentSession >= taskWorkingSessions;
  FocusModeSessionSteps get taskCurrentStep => onStreamTaskCurrentStep.value;
  int get taskLongBreak => taskCurrentPomodoro.longBreak ?? 0;
  int get taskLongBreakInSeconds => taskLongBreak * 1;
  int get taskShortBreak => taskCurrentPomodoro.shortBreak ?? 0;
  int get taskShortBreakInSeconds => taskShortBreak * 1;
  int get taskWorkingSessions => taskCurrentPomodoro.workingSessions ?? 0;
  String get taskTitle => taskCurrentPomodoro.title ?? emptyString;
}
