import 'package:day_night_time_picker/day_night_time_picker.dart';

bool onIsBefore(Time time) {
  final now = DateTime.now();

  final combinedDate = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
    time.second,
  );

  return now.hour == combinedDate.hour && now.minute == combinedDate.minute;
}
