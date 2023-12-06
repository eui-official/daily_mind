part of 'base_audio_handler.dart';

extension BaseTask on DailyMindBackgroundHandler {
  void onTaskInit(Task newTask) {
    onStreamTaskCurrent.add(newTask);

    onTaskReset();
  }

  void onTaskUpdate(Task newTask) {
    onStreamTaskCurrent.add(newTask);
  }

  void onTaskStartOrResume() {
    if (taskCurrentStep == FocusModeSessionSteps.ready) {
      onTaskStart();
    } else {
      onTaskResume();
    }
  }

  void onTaskStart() {
    onTaskUpdateStep(FocusModeSessionSteps.focusing);
    onTaskStartTimer(kPomodoroSessionMaxSeconds);
    onTaskUpdateRunning(true);
  }

  Future<void> onTaskStartTimer(int seconds) async {
    onStreamTaskSeconds.add(seconds);
    onStreamTaskRemainingSeconds.add(seconds);
    taskCountdown = BaseCountdown();

    taskCountdown.onStart(
      seconds: seconds,
      duration: kTick,
      onCounting: (remainingSeconds) {
        onStreamTaskRemainingSeconds.add(remainingSeconds);
        onInitBlankSound();
        onPlayAlarm(remainingSeconds);
      },
      onFinished: onTaskFinished,
    );
  }

  void onPlayAlarm(int remainingSeconds) {
    if (remainingSeconds <= 0) {
      soundEffectAudioPlayer.onPlayAlarm();
    }
  }

  Future<void> onInitBlankSound() async {
    if (taskBackgroundAudioGaplessAudioPlayer.playing) return;

    await taskBackgroundAudioGaplessAudioPlayer.onSetSource(kDefaultAudioId);
    taskBackgroundAudioGaplessAudioPlayer.play();
  }

  Future<void> onTaskFinished() async {
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

  void onTaskUpdateRunning(bool isRunning) {
    onStreamTaskRunning.add(isRunning);
  }

  Future<void> onTaskPause() async {
    taskCountdown.onPause();
    onTaskUpdateRunning(false);
  }

  void onTaskResume() {
    taskCountdown.onResume();
    onTaskUpdateRunning(true);
  }

  void onTaskBreakTime() {
    onTaskUpdateStep(FocusModeSessionSteps.breakTime);

    final breakTimeInSeconds = isShouldTakeALongBreak
        ? taskLongBreakInSeconds
        : taskShortBreakInSeconds;

    onTaskStartTimer(breakTimeInSeconds);
  }

  void onTaskCompleted() {
    taskCurrentSession = 1;
    onTaskUpdateStep(FocusModeSessionSteps.finish);
    onTaskUpdateRunning(false);
    taskCountdown.onCancel();
    soundEffectAudioPlayer.onPlayLevelUp();
  }

  void onTaskRestart() {
    taskCurrentSession = 1;
    taskCountdown.onCancel();
    onTaskStart();
  }

  void onTaskReset() {
    taskCurrentSession = 1;
    onTaskUpdateStep(FocusModeSessionSteps.ready);
    onStreamTaskRemainingSeconds.add(kPomodoroSessionMaxSeconds);
    onStreamTaskSeconds.add(kPomodoroSessionMaxSeconds);
    onTaskUpdateRunning(false);
    taskCountdown.onCancel();
  }

  void onTaskUpdateIsInBackground(bool isInBackground) {
    if (isInBackground && isTimerActive) {
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
