part of 'base_audio_handler.dart';

extension BaseTask on DailyMindBackgroundHandler {
  void onTaskInit(Task newTask) {
    onStreamTaskCurrent.add(newTask);

    onTaskReset();
    onInitBackgroundAudio();
    onWatchForAudioChanged();
  }

  void onWatchForAudioChanged() {
    db.onStreamTask(taskCurrent.id).listen((newTask) {
      onSafeValueBuilder(
        newTask,
        (safeNewTask) {
          onStreamTaskCurrent.add(safeNewTask);
          onInitBackgroundAudio();
        },
      );
    });
  }

  void onTaskStartOrResume() {
    if (taskCurrentStep == FocusModeSessionSteps.ready) {
      onTaskStart();
    } else {
      onTaskResume();
    }
  }

  void onTaskStart() {
    onOnlineDispose();
    onMixDispose();

    onTaskUpdateStep(FocusModeSessionSteps.focusing);
    onTaskStartTimer(
      pomodoroSessionMaxSeconds,
      'Hãy nghỉ ngơi nhé'.tr(),
    );
    onTaskUpdatePlaying(true);
  }

  Future<void> onTaskStartTimer(int seconds, String notificationBody) async {
    onStreamTaskSeconds.add(seconds);
    onStreamTaskRemainingSeconds.add(seconds);

    taskCountdown = BaseCountdown();

    final alarmSettings = AlarmSettings(
      id: taskCurrent.id,
      dateTime: DateTime.now().add(Duration(seconds: seconds)),
      assetAudioPath: 'assets/audios/alarm.mp3',
      loopAudio: false,
      vibrate: true,
      volumeMax: true,
      fadeDuration: 3.0,
      notificationTitle: taskTitle,
      notificationBody: notificationBody,
      enableNotificationOnKill: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);

    taskCountdown.onStart(
      seconds: seconds,
      duration: tick,
      onCounting: (remainingSeconds) {
        onTaskPlayBackgroundAudio();
        onStreamTaskRemainingSeconds.add(remainingSeconds);
      },
      onFinished: onTaskFinished,
    );
  }

  void onUpdateAudioId(dynamic audio, String audioFrom) {
    if (audio is AudioOffline) {
      db.onUpdateAudioId(
        taskCurrent,
        audio.id,
        audioFrom,
      );
    }
  }

  void onDeleteAudioId() {
    db.onDeleteAudioId(taskCurrent);
  }

  void onInitBackgroundAudio() {
    final audioId = taskCurrent.audioId ?? defaultAudioId;

    onTaskDisposeBackgroundAudio();

    taskBackgroundAudioGaplessAudioPlayer = GaplessAudioPlayer();
    taskBackgroundAudioGaplessAudioPlayer.onSetSource(audioId);
    taskBackgroundAudioGaplessAudioPlayer.setVolume(backgroundVolume);
  }

  void onTaskPlayBackgroundAudio() {
    if (taskBackgroundAudioGaplessAudioPlayer.playing) return;
    taskBackgroundAudioGaplessAudioPlayer.play();
  }

  void onTaskPauseBackgroundAudio() {
    if (taskBackgroundAudioGaplessAudioPlayer.playing) {
      taskBackgroundAudioGaplessAudioPlayer.pause();
    }
  }

  void onTaskDisposeBackgroundAudio() {
    taskBackgroundAudioGaplessAudioPlayer.onDispose();
  }

  void onTaskFinished() {
    if (taskCurrentStep == FocusModeSessionSteps.focusing) {
      if (isTaskCompleting) {
        onTaskCompleted();
      } else {
        onTaskBreakTime();
      }
    } else if (taskCurrentStep == FocusModeSessionSteps.breakTime) {
      ++taskCurrentSession;
      onTaskStart();
    }
  }

  void onTaskUpdateStep(FocusModeSessionSteps newCurrentTaskStep) {
    onStreamTaskCurrentStep.add(newCurrentTaskStep);
  }

  void onTaskUpdatePlaying(bool isPlaying) {
    onStreamTaskPlaying.add(isPlaying);
  }

  void onTaskPause() {
    taskCountdown.onPause();
    onTaskUpdatePlaying(false);
    onTaskPauseBackgroundAudio();
  }

  void onTaskResume() {
    taskCountdown.onResume();
    onTaskUpdatePlaying(true);
  }

  void onTaskBreakTime() {
    onTaskUpdateStep(FocusModeSessionSteps.breakTime);

    if (isShouldTakeALongBreak) {
      onTaskStartTimer(
        taskLongBreakInSeconds,
        'Bắt đầu phiên làm việc tiếp theo'.tr(),
      );
    } else {
      onTaskStartTimer(
        taskShortBreakInSeconds,
        'Bắt đầu phiên làm việc tiếp theo'.tr(),
      );
    }
  }

  void onTaskCompleted() {
    taskCurrentSession = 1;
    onTaskUpdateStep(FocusModeSessionSteps.finish);
    onTaskUpdatePlaying(false);
    taskCountdown.onCancel();
    soundEffectAudioPlayer.onPlayLevelUp();
    onTaskPauseBackgroundAudio();
  }

  void onTaskRestart() {
    taskCurrentSession = 1;
    taskCountdown.onCancel();
    onTaskStart();
  }

  void onTaskReset() {
    taskCurrentSession = 1;
    onTaskUpdateStep(FocusModeSessionSteps.ready);
    onStreamTaskRemainingSeconds.add(pomodoroSessionMaxSeconds);
    onStreamTaskSeconds.add(pomodoroSessionMaxSeconds);
    onTaskUpdatePlaying(false);
    taskCountdown.onCancel();
  }

  void onTaskUpdateIsInBackground(bool isInBackground) {
    if (isInBackground && taskCurrentStep == FocusModeSessionSteps.focusing) {
      localNotifications.onShowLocalNotification(
        id: taskCurrent.id,
        title: 'Hãy tập trung',
        body: 'Vui lòng quay lại ứng dụng để tiếp tục công việc',
      );
    } else {
      localNotifications.onCancelNotification(taskCurrent.id);
    }

    taskIsInBackground = isInBackground;
  }
}
