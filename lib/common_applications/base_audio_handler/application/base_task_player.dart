part of 'base_audio_handler.dart';

late Pomodoro currentPomodoro;

extension BaseTaskPlayer on DailyMindAudioHandler {
  void onStartTask(Pomodoro pomodoro) {
    onOnlineDispose();
    onOfflineDispose();
    audioType = AudioTypes.task;

    currentPomodoro = pomodoro;
  }
}
