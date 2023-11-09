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

  void onShowLocalNotification({
    required int id,
    required String title,
    required String body,
  }) {
    final androidNotificationDetail = AndroidNotificationDetails(
      '$id',
      'general',
    );

    final iosNotificatonDetail = DarwinNotificationDetails(
      threadIdentifier: '$id',
    );

    final notificationDetails = NotificationDetails(
      iOS: iosNotificatonDetail,
      android: androidNotificationDetail,
    );

    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }
}

final localNotifications = LocalNotifications();
