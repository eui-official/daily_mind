import 'package:flutter/material.dart';
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
    Duration duration = difference(time);

    if (duration.isNegative) {
      duration = time.difference(this);

      duration = Duration(
        hours: duration.inHours + TimeOfDay.hoursPerPeriod,
        minutes: duration.inMinutes.remainder(TimeOfDay.minutesPerHour),
      );
    }

    return duration;
  }
}
