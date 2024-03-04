import 'package:daily_mind/features/sleep_mode_time_clock/domain/sleep_mode_time_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_time_clock_provider.g.dart';

@riverpod
class SleepModeTimeClockNotifier extends _$SleepModeTimeClockNotifier {
  @override
  SleepModeTimeState build() {
    return SleepModeTimeState(
      currentTime: DateTime.now(),
      endTime: DateTime.now(),
    );
  }

  void onUpdateEndTime(DateTime endTime) {
    state = state.copyWith(endTime: endTime);
  }

  void onUpdateCurrentTime(DateTime currentTime) {
    state = state.copyWith(currentTime: currentTime);
  }
}
