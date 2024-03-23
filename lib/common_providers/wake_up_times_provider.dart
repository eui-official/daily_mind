import 'dart:async';

import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wake_up_times_provider.g.dart';

@riverpod
class WakeUpTimesNotifier extends _$WakeUpTimesNotifier {
  final cycleDuration = 90;

  @override
  List<WakeUpTime> build() {
    onInit();

    return onGetWakeUpTimes();
  }

  List<WakeUpTime> onGetWakeUpTimes() {
    final currentTime = DateTime.now().toLocal();
    final List<WakeUpTime> wakeUpTimes = [];

    for (int i = 0; i < 6; i++) {
      wakeUpTimes.add(
        WakeUpTime(
          cycles: i + 1,
          startTime: currentTime,
          endTime: currentTime.add(
            Duration(minutes: cycleDuration * (i + 1)),
          ),
        ),
      );
    }

    return wakeUpTimes;
  }

  void onInit() {
    Timer.periodic(kLongDuration, (timer) {
      final List<WakeUpTime> wakeUpTimes = onGetWakeUpTimes();
      state = wakeUpTimes;
    });
  }
}
