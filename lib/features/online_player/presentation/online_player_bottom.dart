import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_player_current_audio/presentation/base_player_current_audio.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerBottom extends HookConsumerWidget {
  final Audio audio;

  const OnlinePlayerBottom({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlayerState = ref.watch(onlinePlayerNotifierProvider);

    return BasePlayerCurrentAudio(
      audio: audio,
      isComplex: onlinePlayerState.isExpanded,
    );
  }
}
