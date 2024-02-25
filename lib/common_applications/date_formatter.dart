import 'package:easy_localization/easy_localization.dart';

class DateFormatter {
  final DateFormat df = DateFormat('HH:mm a');

  String onFormatDuration(Duration duration) {
    final hours = duration.inHours;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      duration.inMilliseconds,
      isUtc: true,
    );

    final dateFormat = hours > 0 ? DateFormat.Hms() : DateFormat.ms();

    return dateFormat.format(dateTime);
  }

  String onFormatTime(DateTime dateTime) {
    return df.format(dateTime);
  }
}

final dateFormatter = DateFormatter();
