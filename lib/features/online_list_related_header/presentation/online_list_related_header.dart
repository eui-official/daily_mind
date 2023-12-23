import 'package:daily_mind/features/online_auto_play_next_switch/presentation/online_auto_play_next_switch.dart';
import 'package:daily_mind/features/online_list_related_header/presentation/onlne_list_related_header_from.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: space(
            [
              Text(
                'playingNext'.tr(),
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const OnlineListRelatedHeaderFrom(),
            ],
            height: spacing(),
          ),
        ),
        const OnlineAutoPlayNextSwitch(),
      ],
    );
  }
}
