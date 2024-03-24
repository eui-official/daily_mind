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

  Duration onGetDurationDifference(DateTime time) {
    int hours = hour - time.hour;
    int minutes = minute - time.minute;

    if (hours.isNegative) {
      hours = TimeOfDay.hoursPerDay + hours;
    }

    return Duration(
      hours: hours,
      minutes: minutes,
    );
  }
}
