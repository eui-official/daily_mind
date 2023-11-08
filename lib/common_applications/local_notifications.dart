import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class LocalNotifications {
  Future<void> onInit() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSetting = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  void onShowLocalNotification(String title, String body) {
    const androidNotificationDetail = AndroidNotificationDetails(
      '0',
      'general',
      importance: Importance.max,
    );

    const iosNotificatonDetail = DarwinNotificationDetails(
      interruptionLevel: InterruptionLevel.critical,
    );

    const notificationDetails = NotificationDetails(
      iOS: iosNotificatonDetail,
      android: androidNotificationDetail,
    );

    flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }
}

final localNotifications = LocalNotifications();
