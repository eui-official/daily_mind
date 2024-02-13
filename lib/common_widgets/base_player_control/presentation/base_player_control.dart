import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_actions.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasePlayerControl extends HookConsumerWidget {
  final dynamic audio;

  const BasePlayerControl({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final player = baseBackgroundHandler.onlinePlayer;
    final duration = player.duration;

    final positionSnapshot = useStream(player.positionStream);
    final playingSnapshot = useStream(player.playingStream);

    final seconds = duration?.inSeconds ?? 0;
    final isPlaying = playingSnapshot.data ?? false;

    final child = useMemoized(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BasePlayerTime(
            max: seconds,
            onChangeEnd: baseBackgroundHandler.onlinePlayer.seek,
            position: positionSnapshot.data?.inSeconds ?? 0,
          ),
          BasePlayerActions(
            isPlaying: isPlaying,
            onPlay: baseBackgroundHandler.play,
            onPause: baseBackgroundHandler.pause,
            onNext: baseBackgroundHandler.skipToNext,
            onPrevious: baseBackgroundHandler.skipToPrevious,
          ),
        ],
      );
    }, [audio, seconds, positionSnapshot]);

    return child;
  }
}
