import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:daily_mind/common_applications/notifications.dart';
import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/constants/offline_wake_up_audios.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/alarm_history.dart';
import 'package:daily_mind/features/sleep_mode/domain/sleep_mode_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_provider.g.dart';

@riverpod
class SleepModeNotifier extends _$SleepModeNotifier {
  @override
  SleepModeState build() {
    onInit();

    return SleepModeState(
      wakeUpOfflineAudio: kOfflineWakeUpAudios.first,
      endTime: DateTime.now(),
    );
  }

  void onInit() {
    Alarm.ringStream.stream.listen((alarmSetting) {});
  }

  void onWakeUpOfflineAudioChanged(OfflineAudio wakeUpOfflineAudio) {
    state = state.copyWith(wakeUpOfflineAudio: wakeUpOfflineAudio);
  }

  void onEndTimeChanged(DateTime endTime) {
    state = state.copyWith(endTime: endTime);
  }

  void onStartAlarmHistory(AlarmHistory alarmHistory) {
    final endTime = alarmHistory.endTime;

    if (endTime != null) {
      state = state.copyWith(
        wakeUpOfflineAudio: kOfflineWakeUpAudios.firstWhere(
          (element) => element.id == alarmHistory.audioId,
        ),
        endTime: endTime,
      );

      onStartAlarm(isFromHistory: true);
    }
  }

  void onStartAlarm({bool isFromHistory = false}) async {
    final status = await notifications.onCheckPermissions();

    if (status) {
      final title = 'Xin chào,'.tr();
      final body = 'Đã đến giờ thức dậy'.tr();

      await Alarm.setNotificationOnAppKillContent(title, body);

      final alarmSettings = AlarmSettings(
        id: 1,
        dateTime: state.endTime,
        assetAudioPath: state.wakeUpOfflineAudioPath,
        loopAudio: true,
        vibrate: true,
        volume: 0.8,
        fadeDuration: 30,
        notificationTitle: title,
        notificationBody: body,
        enableNotificationOnKill: true,
      );

      if (!isFromHistory) {
        db.onAddAlarm(
          state.endTime,
          state.wakeUpOfflineAudio.id,
        );
      }

      await Alarm.set(alarmSettings: alarmSettings);
    }
  }

  void onStopAlarm() {
    Alarm.stop(1);
  }
}
