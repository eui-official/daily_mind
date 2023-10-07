import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BasePlayerTimeDisplay extends StatelessWidget {
  final int seconds;

  const BasePlayerTimeDisplay({
    super.key,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      dateFormatter.onFormatDuration(
        Duration(seconds: seconds),
      ),
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.theme.hintColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
