part of 'base_audio_handler.dart';

const double kMasterVolumeMax = 1;
const double kMasterVolumeDecayed = 0.1;

extension BaseTimerPlayer on DailyMindBackgroundHandler {
  Duration onCalculateRemainingTime(TimeOfDay targetTime) {
    DateTime now = DateTime.now();
    bool isTomorrow = (targetTime.hour - now.hour).isNegative;
    final day = isTomorrow ? now.day + 1 : now.day;

    DateTime targetDateTime = DateTime(
      now.year,
      now.month,
      day,
      targetTime.hour,
      targetTime.minute,
    );

    Duration remainingTime = targetDateTime.difference(now);

    return remainingTime;
  }

  void onUpdateTimerRemaining(TimeOfDay timeOfDay) {
    final remainingTime = onCalculateRemainingTime(timeOfDay);
    onStreamTimerRemaining.add(remainingTime);
  }

  void onResetTimerRemaining() {
    onStreamTimerRemaining.add(Duration.zero);
  }

  void onResetMasterVolume() {
    onMasterVolumeController.add(kMasterVolumeMax);
  }

  void onCalculateMasterVolume() {
    final seconds = remainingTime.inSeconds;

    if (seconds > 10) {
      onMasterVolumeController.add(kMasterVolumeMax);
    } else {
      onMasterVolumeController.add(seconds * kMasterVolumeDecayed);
    }
  }

  void onStartTimer(TimeOfDay timeOfDay) {
    timer?.cancel();
    onUpdateTimerRemaining(timeOfDay);

    timer = Timer.periodic(kLongDuration, (currentTimer) {
      final seconds = remainingTime.inSeconds;

      if (seconds.isEqual(0)) {
        pause();
        timer?.cancel();
        onResetTimerRemaining();
        onResetMasterVolume();
      } else {
        onUpdateTimerRemaining(timeOfDay);
        onCalculateMasterVolume();
      }
    });
  }

  void onDeletedTimer() {
    timer?.cancel();
    onResetTimerRemaining();
  }
}
