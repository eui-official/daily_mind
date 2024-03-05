import 'package:progressive_time_picker/progressive_time_picker.dart';

extension DateTimeExt on DateTime {
  PickedTime get toPickedTime {
    return PickedTime(
      h: hour,
      m: minute,
    );
  }

  DateTime withHourAndMinute({
    required int hour,
    required int minute,
  }) {
    return copyWith(
      hour: hour,
      minute: minute,
    );
  }

  Duration onGetDifference(DateTime time) {
    Duration duration;

    if (time.isBefore(this)) {
      duration = difference(time);
    } else {
      final subtractSleepTime =
          time.subtract(const Duration(hours: Duration.hoursPerDay));

      duration = subtractSleepTime.difference(this).abs();
    }

    int totalMinutes = duration.inMinutes;
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;

    duration = Duration(
      hours: hours,
      minutes: minutes,
    );

    return duration;
  }
}
