import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_actions.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasePlayerControl extends HookWidget {
  final DailyMindAudioHandler audioHandler;

  const BasePlayerControl({
    super.key,
    required this.audioHandler,
  });

  @override
  Widget build(BuildContext context) {
    final player = audioHandler.onlinePlayer.player;
    final duration = player.duration;
    final positionSnapshot = useStream(player.positionStream);
    final playingSnapshot = useStream(player.playingStream);

    final seconds = duration?.inSeconds ?? 0;
    final isPlaying = playingSnapshot.data ?? false;

    return Column(
      children: [
        BasePlayerTime(
          max: seconds,
          onChangeEnd: audioHandler.onlinePlayer.onSeek,
          value: positionSnapshot.data?.inSeconds ?? 0,
        ),
        BasePlayerActions(
          isPlaying: isPlaying,
          onPlay: audioHandler.play,
          onPause: audioHandler.pause,
        ),
      ],
    );
  }
}