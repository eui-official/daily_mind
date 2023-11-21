import 'package:alarm/alarm.dart';

class BaseAlarm {
  AlarmSettings onCreateAlarmSettings({
    required int id,
    required int seconds,
    required String notificationTitle,
    required String notificationBody,
  }) {
    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: DateTime.now().add(Duration(seconds: seconds)),
      assetAudioPath: 'assets/audios/alarm.mp3',
      loopAudio: false,
      vibrate: false,
      volumeMax: false,
      fadeDuration: 3,
      notificationTitle: notificationTitle,
      notificationBody: notificationBody,
      enableNotificationOnKill: true,
    );

    return alarmSettings;
  }
}

final baseAlarm = BaseAlarm();
