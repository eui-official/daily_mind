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

  void onTaskStart() {
    onOnlineDispose();
    onOfflineDispose();
    audioType = AudioTypes.task;

    onTaskUpdateStep(FocusModeSessionSteps.focusing);
    onTaskStartTimer(pomodoroSessionMaxSeconds);
    onTaskUpdatePlaying(true);
  }

  void onTaskStartTimer(int seconds) {
    onStreamTaskSeconds.add(seconds);
    onStreamTaskRemainingSeconds.add(seconds);

    taskCountdown = BaseCountdown();

    taskCountdown.onStart(
      seconds: seconds,
      duration: tick,
      onCounting: (remainingSeconds) {
        onPlaySounds(remainingSeconds);
        onStreamTaskRemainingSeconds.add(remainingSeconds);
        onTaskPlayBackgroundAudio();
      },
      onFinished: onTaskFinished,
    );
  }

  void onPlaySounds(int remainingSeconds) {
    if (remainingSeconds <= 2) {
      soundEffectAudioPlayer.onPlayDing();
    }
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
    final audioId = taskCurrent.audioId;

    onSafeValueBuilder(
      audioId,
      (safeAudioId) {
        taskBackgroundAudioGaplessAudioPlayer = GaplessAudioPlayer();
        taskBackgroundAudioGaplessAudioPlayer.onSetSource(safeAudioId);
        taskBackgroundAudioGaplessAudioPlayer.setVolume(backgroundVolume);
      },
      () {
        onTaskDisposeBackgroundAudio();
      },
    );
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
    taskBackgroundAudioGaplessAudioPlayer.dispose();
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
      onTaskStartTimer(taskLongBreakInSeconds);
    } else {
      onTaskStartTimer(taskShortBreakInSeconds);
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
}
