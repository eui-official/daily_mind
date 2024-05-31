import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/alarm_history.dart';
import 'package:daily_mind/features/sleep_mode/presentation/sleep_mode_provider.dart';
import 'package:daily_mind/features/sleep_mode_list_alarm/domain/sleep_mode_list_alarm_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_list_alarm_provider.g.dart';

@riverpod
class SleepModeListAlarmNotifier extends _$SleepModeListAlarmNotifier {
  @override
  SleepModeListAlarmState build() {
    onInit();

    return SleepModeListAlarmState(
      alarmHistories: db.onGetAlarmHistories(),
    );
  }

  void onStartAlarm(AlarmHistory alarmHistory) {
    final sleepModeNotifier = ref.read(sleepModeNotifierProvider.notifier);

    if (state.selectedAlarmHistory != null) {
      sleepModeNotifier.onStopAlarm();
      state = state.copyWith(selectedAlarmHistory: null);
    } else {
      sleepModeNotifier.onStartAlarmHistory(alarmHistory);
      state = state.copyWith(selectedAlarmHistory: alarmHistory);
    }
  }

  void onStopAlarm(AlarmHistory alarmHistory) {
    state = state.copyWith(selectedAlarmHistory: null);
  }

  void onInit() {
    db.onStreamAlarmHistories().listen((alarmHistories) {
      state = state.copyWith(alarmHistories: alarmHistories);
    });
  }
}
