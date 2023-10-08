import 'package:daily_mind/features/online_auto_play_switch/presentation/online_auto_play_switch.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class OnlineListRelatedHeader extends StatelessWidget {
  const OnlineListRelatedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: spacing(4),
        horizontal: spacing(2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'playingNext'.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const OnlineAutoPlaySwitch(),
        ],
      ),
    );
  }
}
