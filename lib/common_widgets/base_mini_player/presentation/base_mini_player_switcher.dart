import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/features/mix_mini_player/presentation/mix_mini_player.dart';
import 'package:daily_mind/features/online_mini_player/presentation/online_mini_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseMiniPlayerSwitcher extends HookConsumerWidget {
  const BaseMiniPlayerSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseMiniPlayerState = ref.watch(baseMiniPlayerProvider);

    final child = useMemoized(() {
      if (baseMiniPlayerState.isShow) {
        if (baseMiniPlayerState.audioType == AudioTypes.online) {
          return const OnlineMiniPlayer();
        } else if (baseMiniPlayerState.audioType == AudioTypes.mix) {
          return const MixMiniPlayer();
        }
      }

      return emptyWidget;
    }, [baseMiniPlayerState]);

    return BaseAnimatedSwitcher(
      key: ValueKey(baseMiniPlayerState),
      child: child,
    );
  }
}
