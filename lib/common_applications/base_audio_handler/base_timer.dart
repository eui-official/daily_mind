part of 'base_audio_handler.dart';

extension BaseTimerPlayer on DailyMindBackgroundHandler {
  void onStartTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (currentTimer) {
      if (onIsBefore(time)) {
        pause();
        timer?.cancel();
      }
    });
  }

  void onDeletedTimer() {
    timer?.cancel();
  }
}
