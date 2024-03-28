import 'package:easy_localization/easy_localization.dart';

class DateFormatter {
  final DateFormat df = DateFormat('hh:mm a');

  String onFormatDurationHours(
    Duration duration, {
    DateFormat? hoursFormat,
    DateFormat? minutesFormat,
  }) {
    hoursFormat ??= DateFormat.Hms();
    minutesFormat ??= DateFormat.ms();

    final hours = duration.inHours;

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      duration.inMilliseconds,
      isUtc: true,
    );

    final dateFormat = hours > 0 ? hoursFormat : minutesFormat;

    return dateFormat.format(dateTime);
  }

  String onFormatDuration(Duration duration) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      duration.inMilliseconds,
      isUtc: true,
    );

    final dateFormat = DateFormat.Hm();

    return dateFormat.format(dateTime);
  }

  String onFormatTime24h(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  String onFormatTime(DateTime dateTime) {
    return df.format(dateTime);
  }
}

final dateFormatter = DateFormatter();
