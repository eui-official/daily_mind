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
      if (taskCurrentSession >= workingSessions) {
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

  void onTaskPause() {
    taskCountdown.onPause();
  }

  void onTaskResume() {
    taskCountdown.onResume();
  }

  void onTaskBreakTime() {
    onTaskUpdateStep(FocusModeSessionSteps.breakTime);

    bool isCircleFourSessions = taskCurrentSession % 4 == 0;

    if (isCircleFourSessions) {
      onTaskStartTimer(longBreakInSeconds);
    } else {
      onTaskStartTimer(shortBreakInSeconds);
    }
  }

  void onTaskCompleted() {
    taskCurrentSession = 1;
    onTaskUpdateStep(FocusModeSessionSteps.finish);
    soundEffectAudioPlayer.onPlayLevelUp();
  }
}
