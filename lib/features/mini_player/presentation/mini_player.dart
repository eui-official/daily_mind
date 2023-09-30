import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_toggle_button.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marquee/marquee.dart';

class MiniPlayer extends HookConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final miniPlayerState = ref.watch(miniPlayerProvider);

    return Container(
      height: spacing(8),
      margin: EdgeInsets.all(spacing(2)),
      padding: EdgeInsets.symmetric(horizontal: spacing()),
      decoration: BoxDecoration(
        color: context.theme.focusColor,
        borderRadius: BorderRadius.circular(spacing()),
      ),
      child: Row(
        children: space([
          if (miniPlayerState.image.isNotEmpty)
            Container(
              padding: EdgeInsets.only(left: spacing()),
              child: BaseNetworkImage(
                image: miniPlayerState.image,
                size: 5,
              ),
            ),
          Flexible(
            child: Marquee(
              text: miniPlayerState.title,
              blankSpace: spacing(3),
              fadingEdgeEndFraction: 1,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const MiniPlayerToggleButton(),
        ], width: spacing(2)),
      ),
    );
  }
}
