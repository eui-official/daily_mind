import 'package:daily_mind/common_applications/audio_handler.dart';
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
    final duration = audioHandler.onlinePlayer.player.duration;
    final positionSnapshot =
        useStream(audioHandler.onlinePlayer.player.positionStream);
    final seconds = duration?.inSeconds ?? 0;

    return Column(
      children: [
        BasePlayerTime(
          value: positionSnapshot.data?.inSeconds ?? 0,
          max: seconds,
          onChanged: (value) {},
          onChangeEnd: (value) {},
        ),
      ],
    );
  }
}
