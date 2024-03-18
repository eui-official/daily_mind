import 'package:daily_mind/features/sleep_mode/domain/sleep_mode_state.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_provider.g.dart';

@riverpod
class SleepModeNotifier extends _$SleepModeNotifier {
  @override
  SleepModeState build() {
    return const SleepModeState();
  }

  void onStartSleeping() {
    final sleepModeTimeClockState =
        ref.read(sleepModeTimeClockNotifierProvider);

    print(sleepModeTimeClockState);
  }
}
