part of 'base_audio_handler.dart';

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

  void onStartTimer(TimeOfDay timeOfDay) {
    timer?.cancel();
    onUpdateTimerRemaining(timeOfDay);

    timer = Timer.periodic(const Duration(seconds: 1), (currentTimer) {
      if (remainingTime.inSeconds <= 0) {
        pause();
        timer?.cancel();
        onResetTimerRemaining();
      } else {
        onUpdateTimerRemaining(timeOfDay);
      }
    });
  }

  void onDeletedTimer() {
    timer?.cancel();
    onResetTimerRemaining();
  }
}
