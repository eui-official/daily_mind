import 'package:daily_mind/common_widgets/base_time_picker/presentation/base_time_picker.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BasePlayerUserActions extends StatelessWidget {
  final List<Widget> actions;
  final EdgeInsets? padding;

  const BasePlayerUserActions({
    super.key,
    this.actions = const [],
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: spacing(2)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: space(
            [
              const BaseTimerPicker(),
              ...actions,
            ],
            width: spacing(4),
          ),
        ),
      ),
    );
  }
}
