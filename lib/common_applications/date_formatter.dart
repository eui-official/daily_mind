import 'package:easy_localization/easy_localization.dart';

class DateFormatter {
  String onFormatDuration(Duration duration) {
    final hours = duration.inHours;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      duration.inMilliseconds,
      isUtc: true,
    );

    final dateFormat = hours > 0 ? DateFormat.Hms() : DateFormat.ms();

    return dateFormat.format(dateTime);
  }
}

final dateFormatter = DateFormatter();
