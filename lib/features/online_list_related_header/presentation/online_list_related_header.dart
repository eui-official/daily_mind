import 'package:daily_mind/features/online_auto_play_next_switch/presentation/online_auto_play_next_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class OnlineListRelatedHeader extends StatelessWidget {
  const OnlineListRelatedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'playingNext'.tr(),
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const OnlineAutoPlayNextSwitch(),
      ],
    );
  }
}
