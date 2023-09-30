import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_toggle_button.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MiniPlayer extends HookConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final miniPlayerState = ref.watch(miniPlayerProvider);

    return Container(
      margin: EdgeInsets.all(spacing(2)),
      padding: EdgeInsets.all(spacing()),
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
            child: Text(
              miniPlayerState.title,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const MiniPlayerToggleButton(),
        ], width: spacing(2)),
      ),
    );
  }
}
