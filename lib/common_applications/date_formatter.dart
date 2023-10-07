import 'package:easy_localization/easy_localization.dart';

class DateFormatter {
  String onFormatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      duration.inMilliseconds,
      isUtc: true,
    );

    if (hours > 0) {
      return DateFormat.Hms().format(dateTime);
    }

    if (minutes > 0) {
      return DateFormat.ms().format(dateTime);
    }

    return DateFormat.s().format(dateTime);
  }
}

final dateFormatter = DateFormatter();
