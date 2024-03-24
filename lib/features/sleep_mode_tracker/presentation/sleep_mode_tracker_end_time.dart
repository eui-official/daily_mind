import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:flutter/material.dart';

class SleepModeTrackerEndTime extends StatelessWidget {
  final DateTime endTime;

  const SleepModeTrackerEndTime({
    super.key,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.notifications),
      shape: const StadiumBorder(
        side: BorderSide(style: BorderStyle.none),
      ),
      label: Text('Thức dậy lúc ${dateFormatter.onFormatTime24h(endTime)}'),
    );
  }
}
