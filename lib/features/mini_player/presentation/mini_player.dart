import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MiniPlayer extends HookConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final miniPlayerState = ref.watch(miniPlayerProvider);

    return Container();
  }
}
