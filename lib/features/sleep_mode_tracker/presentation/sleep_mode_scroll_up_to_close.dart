import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';

class SleepModeScrollUpToClose extends StatelessWidget {
  const SleepModeScrollUpToClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            context.theme.primaryColorDark,
            BlendMode.srcIn,
          ),
          child: Lottie.asset(
            'assets/lotties/arrow_up.json',
            fit: BoxFit.cover,
            height: spacing(4),
            width: spacing(4),
          ),
        ),
        Text(
          'Vuốt lên để ngừng báo thức',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.theme.hintColor,
          ),
        ),
      ],
    );
  }
}
