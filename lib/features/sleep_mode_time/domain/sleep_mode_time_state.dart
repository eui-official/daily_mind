import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_mode_time_state.freezed.dart';

@freezed
class SleepModeTimeState with _$SleepModeTimeState {
  const factory SleepModeTimeState({
    required DateTime currentTime,
    required DateTime endTime,
  }) = _SleepModeTimeState;
}
