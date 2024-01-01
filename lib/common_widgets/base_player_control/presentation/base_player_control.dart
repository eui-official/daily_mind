import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_actions.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasePlayerControl extends HookWidget {
  final DailyMindBackgroundHandler backgroundHandler;
  final dynamic tag;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const BasePlayerControl({
    super.key,
    required this.backgroundHandler,
    required this.tag,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    final player = backgroundHandler.onlinePlayer;
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
            onChangeEnd: backgroundHandler.onlinePlayer.seek,
            position: positionSnapshot.data?.inSeconds ?? 0,
            tag: tag,
          ),
          BasePlayerActions(
            isPlaying: isPlaying,
            onPlay: backgroundHandler.play,
            onPause: backgroundHandler.pause,
            onNext: onNext,
            onPrevious: onPrevious,
          ),
        ],
      );
    }, [tag, seconds, positionSnapshot]);

    return child;
  }
}
