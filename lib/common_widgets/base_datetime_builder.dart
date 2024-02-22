import 'dart:async';

import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/constants/constants.dart';
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
    final dateTime = useState(DateTime.now().toLocal());

    useEffectDelayed(() {
      Timer.periodic(kLongDuration, (timer) {
        dateTime.value = DateTime.now().toLocal();
      });
    }, []);

    return builder(dateTime.value);
  }
}
