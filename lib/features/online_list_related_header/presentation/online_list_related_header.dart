import 'package:daily_mind/features/online_auto_play_next_switch/presentation/online_auto_play_next_switch.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineListRelatedHeader extends HookConsumerWidget {
  const OnlineListRelatedHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlayerState = ref.watch(onlinePlayerProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: space(
            [
              Text(
                'playingNext'.tr(),
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Từ ${onlinePlayerState.name}',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: secondaryTextColor,
                ),
              ),
            ],
            height: spacing(),
          ),
        ),
        const OnlineAutoPlayNextSwitch(),
      ],
    );
  }
}
