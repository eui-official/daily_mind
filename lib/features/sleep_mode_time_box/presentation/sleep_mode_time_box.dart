import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/common_widgets/base_dropdown_selector_card.dart';
import 'package:daily_mind/extensions/theme.dart';
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
    return BaseDropdownSelectorCard(
      color: context.theme.menuBackground,
      onTap: onTap,
      trailing: Text(dateFormatter.onFormatTime(time)),
      icon: const Icon(Icons.timelapse_rounded),
      child: Text(title),
    );
  }
}
