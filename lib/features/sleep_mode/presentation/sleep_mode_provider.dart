import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:daily_mind/common_applications/notifications.dart';
import 'package:daily_mind/features/sleep_mode/domain/sleep_mode_state.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_provider.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_audios/presentation/sleep_mode_wake_up_audios_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_provider.g.dart';

@riverpod
class SleepModeNotifier extends _$SleepModeNotifier {
  @override
  SleepModeState build() {
    onInit();

    return const SleepModeState();
  }

  void onInit() {
    Alarm.ringStream.stream.listen((event) {});
  }

  void onStartSleeping() async {
    final status = await notifications.onCheckPermissions();

    if (status) {
      final sleepModeTimeClockState =
          ref.read(sleepModeTimeClockNotifierProvider);
      final sleepModeWakeUpAudiosState =
          ref.read(sleepModeWakeUpAudiosNotifierProvider);
      const title = 'Xin chào,';
      const body = 'Đã đến giờ thức dậy';

      await Alarm.setNotificationOnAppKillContent(title, body);

      final alarmSettings = AlarmSettings(
        id: 42,
        dateTime: sleepModeTimeClockState.endTime,
        assetAudioPath:
            sleepModeWakeUpAudiosState.wakeUpOfflineAudio.sources.first,
        loopAudio: true,
        vibrate: true,
        volume: 0.8,
        fadeDuration: 30,
        notificationTitle: title,
        notificationBody: body,
        enableNotificationOnKill: true,
      );

      await Alarm.set(alarmSettings: alarmSettings);
    }
  }
}
