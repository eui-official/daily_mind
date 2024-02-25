import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseDatetimeBuilder extends HookWidget {
  final OnWidgetBuilder<DateTime> builder;

  const BaseDatetimeBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final dateTime = useBaseDateTimeTicker();

    return builder(dateTime);
  }
}
