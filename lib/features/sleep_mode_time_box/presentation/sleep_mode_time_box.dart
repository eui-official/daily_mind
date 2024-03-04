import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SleepModeTimeBox extends StatelessWidget {
  final String title;
  final DateTime time;
  final VoidCallback onTap;

  const SleepModeTimeBox({
    super.key,
    required this.title,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInkWell(
      onTap: onTap,
      child: BaseContentHeader(
        title: title,
        crossAxisAlignment: CrossAxisAlignment.center,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            dateFormatter.onFormatTime(time),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
