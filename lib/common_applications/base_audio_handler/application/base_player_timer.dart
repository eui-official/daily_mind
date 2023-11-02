part of 'base_audio_handler.dart';

extension BasePlayerTimer on DailyMindAudioHandler {
  void onStartTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (currentTimer) {
      if (isBefore(time)) {
        pause();
        timer?.cancel();
      }
    });
  }

  void onDeletedTimer() {
    timer?.cancel();
  }
}
