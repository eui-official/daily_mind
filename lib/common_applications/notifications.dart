import 'package:alarm/alarm.dart';
import 'package:permission_handler/permission_handler.dart';

class Notifications {
  Future<bool> onCheckPermissions() async {
    final status = await Permission.notification.status;

    if (status.isDenied) {
      alarmPrint('Requesting notification permission...');

      final request = await Permission.notification.request();

      if (request.isGranted) {
        return true;
      } else {
        return false;
      }
    }

    return true;
  }
}

final notifications = Notifications();
