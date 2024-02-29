import 'package:daily_mind/features/sleep_mode_current_time/domain/sleep_mode_current_time_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_current_time_provider.g.dart';

@riverpod
class SleepModeCurrentTimeNotifier extends _$SleepModeCurrentTimeNotifier {
  @override
  SleepModeCurrentTimeState build(DateTime endTime) {
    return SleepModeCurrentTimeState(
      currentTime: DateTime.now(),
      endTime: endTime,
    );
  }
}
