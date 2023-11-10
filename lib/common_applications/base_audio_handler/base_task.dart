part of 'base_audio_handler.dart';

extension BaseTask on DailyMindBackgroundHandler {
  void onTaskInit(Pomodoro newPomodoro) {
    taskCurrentPomodoro = newPomodoro;
    onStreamTaskCurrentStep.add(FocusModeSessionSteps.ready);
    onStreamTaskSeconds.add(pomodoroSessionMaxSeconds);
    onStreamTaskRemainingSeconds.add(pomodoroSessionMaxSeconds);
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
      },
      onFinished: onTaskFinished,
    );
  }

  void onPlaySounds(int remainingSeconds) {
    if (remainingSeconds <= 2) {
      soundEffectAudioPlayer.onPlayDing();
    }
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
  }

  void onTaskReset() {
    taskCurrentSession = 1;
    onTaskUpdateStep(FocusModeSessionSteps.ready);
    onTaskUpdatePlaying(false);
    taskCountdown.onCancel();
  }
}
