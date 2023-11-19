import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/base_count_down.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/schemas/task.dart';
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
}

mixin BaseAudioOnHoldVariables on BaseAudioHandler {
  bool isPreviousPlaying = true;
}

mixin BaseTaskVariables on BaseAudioHandler {
  BaseCountdown taskCountdown = BaseCountdown();
  GaplessAudioPlayer taskBackgroundAudioGaplessAudioPlayer =
      GaplessAudioPlayer();
  int taskCurrentSession = 1;
  bool taskIsInBackground = false;

  BehaviorSubject<Task> onStreamTaskCurrent = BehaviorSubject();
  BehaviorSubject<bool> onStreamTaskPlaying = BehaviorSubject();
  BehaviorSubject<int> onStreamTaskRemainingSeconds = BehaviorSubject();
  BehaviorSubject<int> onStreamTaskSeconds = BehaviorSubject();
  BehaviorSubject<FocusModeSessionSteps> onStreamTaskCurrentStep =
      BehaviorSubject();

  bool get isShouldTakeALongBreak => taskCurrentSession % 4 == 0;
  bool get isTaskCompleting =>
      taskCurrentSession >= taskWorkingSessions && taskWorkingSessions > 0;
  FocusModeSessionSteps get taskCurrentStep => onStreamTaskCurrentStep.value;
  int get taskLongBreak => taskCurrent.longBreak ?? 0;
  int get taskLongBreakInSeconds => taskLongBreak * 60;
  int get taskShortBreak => taskCurrent.shortBreak ?? 0;
  int get taskShortBreakInSeconds => taskShortBreak * 60;
  int get taskWorkingSessions => taskCurrent.workingSessions ?? 0;
  String get taskTitle => taskCurrent.title ?? emptyString;
  Task get taskCurrent => onStreamTaskCurrent.value;
}

mixin BaseTimer on BaseAudioHandler {
  BehaviorSubject<Duration> onStreamTimerRemaining = BehaviorSubject()
    ..add(Duration.zero);

  Duration get remainingTime => onStreamTimerRemaining.value;

  Timer? timer;
}
