import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/features/offline_mini_player/presentation/offline_mini_player.dart';
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
        if (baseMiniPlayerState.networkType == NetworkType.online) {
          return const OnlineMiniPlayer();
        }

        return const OfflineMiniPlayer();
      }

      return emptyWidget;
    }, [baseMiniPlayerState]);

    return AnimatedSwitcher(
      key: ValueKey(baseMiniPlayerState),
      duration: defaultDuration,
      child: child,
    );
  }
}
