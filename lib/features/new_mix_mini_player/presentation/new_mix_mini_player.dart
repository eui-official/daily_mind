import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixMiniPlayer extends HookConsumerWidget {
  const NewMixMiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseMiniPlayerState = ref.watch(baseMiniPlayerProvider);
    final newMixState = ref.watch(newMixProvider);

    print(newMixState);

    return BaseMiniPlayer(
      onTap: () {},
      title: '4 mix',
      leading: Container(),
      isLoading: false,
      isPlaying: false,
      onPause: () {},
      onPlay: () {},
    );
  }
}
