import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_mode_state.freezed.dart';

@freezed
class SleepModeState with _$SleepModeState {
  const factory SleepModeState({
    WakeUpTime? wakeUpTime,
  }) = _SleepModeState;
}
