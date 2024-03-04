import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
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
