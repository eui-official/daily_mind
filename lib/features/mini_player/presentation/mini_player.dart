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
          miniPlayerState.image,
          if (miniPlayerState.title.isNotEmpty)
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
