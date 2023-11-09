part of 'base_audio_handler.dart';

late Pomodoro currentPomodoro;

extension BaseTaskPlayer on DailyMindAudioHandler {
  void onTaskInit(Pomodoro pomodoro) {
    onOnlineDispose();
    onOfflineDispose();
    audioType = AudioTypes.task;

    currentPomodoro = pomodoro;

    onTaskStart();
  }

  void onTaskStart() {
    onStreamTaskTotalSeconds.add(pomodoroSessionSeconds);

    baseCountDown.onCountDown(
      seconds: pomodoroSessionSeconds,
      duration: tick,
      onCounting: (remainingSeconds) {
        onStreamTaskRemainingSeconds.add(remainingSeconds);
      },
    );
  }

  void onTaskPause() {
    baseCountDown.onPause();
  }

  void onTaskResume() {
    baseCountDown.onResume();
  }
}
