import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SleepModeTrackerMoon extends StatelessWidget {
  const SleepModeTrackerMoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(3)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            context.theme.primaryColorDark,
          ],
        ),
        border: Border.all(
          color: context.theme.primaryColorDark,
        ),
      ),
      child: Image.asset(
        'assets/icons/moon.png',
        width: spacing(4),
        height: spacing(4),
        color: context.theme.primaryColor,
      ),
    );
  }
}
