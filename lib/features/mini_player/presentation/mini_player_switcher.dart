import 'package:daily_mind/features/mini_player/presentation/mini_player.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MiniPlayerSwitcher extends HookConsumerWidget {
  const MiniPlayerSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final miniPlayerState = ref.watch(miniPlayerProvider);

    return AnimatedCrossFade(
      firstChild: const SizedBox.shrink(),
      secondChild: const MiniPlayer(),
      crossFadeState: miniPlayerState.isShow
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: kThemeChangeDuration,
    );
  }
}
