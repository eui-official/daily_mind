import 'package:daily_mind/common_widgets/base_time_picker/presentation/base_time_picker.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BasePlayerUserActions extends StatelessWidget {
  final List<Widget> actions;

  const BasePlayerUserActions({
    super.key,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(spacing(2)),
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
          borderRadius: circularRadius(2),
        ),
        child: Row(
          children: [
            const BaseTimerPicker(),
            ...actions,
          ],
        ),
      ),
    );
  }
}
