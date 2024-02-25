import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';

class SleepModeTimeRecommended extends StatelessWidget {
  const SleepModeTimeRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: circularRadius(3),
        side: BorderSide(
          color: context.theme.primaryColorDark,
        ),
      ),
      backgroundColor: context.theme.primaryColorDark.withOpacity(0.4),
      label: const Text('Đề xuất'),
    );
  }
}
