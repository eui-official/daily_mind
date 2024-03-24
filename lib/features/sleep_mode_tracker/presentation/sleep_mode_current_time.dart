import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeCurrentTime extends HookWidget {
  const SleepModeCurrentTime({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTime = useBaseDateTimeTicker();

    return Text(
      dateFormatter.onFormatTime24h(currentTime),
      style: context.textTheme.headlineLarge,
    );
  }
}
