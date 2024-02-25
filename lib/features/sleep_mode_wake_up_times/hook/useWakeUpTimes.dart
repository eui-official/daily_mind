import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';

List<WakeUpTime> useWakeUpTimes({
  int cycleDuration = 90,
}) {
  final currentTime = useBaseDateTimeTicker();
  final List<WakeUpTime> wakeUpTimes = [];

  for (int i = 0; i < 6; i++) {
    wakeUpTimes.add(
      WakeUpTime(
        cycles: i + 1,
        startTime: currentTime,
        endTime: currentTime.add(Duration(minutes: cycleDuration * (i + 1))),
      ),
    );
  }

  return wakeUpTimes;
}
