import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_mode_current_time_state.freezed.dart';

@freezed
class SleepModeCurrentTimeState {
  const factory SleepModeCurrentTimeState({
    required DateTime currentTime,
    required DateTime endTime,
  }) = _SleepModeCurrentTimeState;
}
