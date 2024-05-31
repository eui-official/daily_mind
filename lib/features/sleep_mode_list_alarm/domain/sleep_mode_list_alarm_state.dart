import 'package:daily_mind/db/schemas/alarm_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_mode_list_alarm_state.freezed.dart';

@freezed
class SleepModeListAlarmState with _$SleepModeListAlarmState {
  const factory SleepModeListAlarmState({
    @Default([]) List<AlarmHistory> alarmHistories,
    AlarmHistory? selectedAlarmHistory,
  }) = _SleepModeListAlarmState;
}
