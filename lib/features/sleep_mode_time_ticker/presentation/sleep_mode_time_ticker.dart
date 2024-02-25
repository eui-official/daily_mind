import 'package:daily_mind/common_widgets/base_datetime_builder/presentation/base_datetime_builder.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SleepModeTimeTicker extends StatelessWidget {
  const SleepModeTimeTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDatetimeBuilder(
      builder: (dateTime) {
        final df = DateFormat(DateFormat.HOUR_MINUTE);

        return Text(
          df.format(dateTime),
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: spacing(0.5),
          ),
        );
      },
    );
  }
}
