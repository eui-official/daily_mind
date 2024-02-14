import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/features/disk_player_image/presentation/disk_player_image.dart';
import 'package:daily_mind/features/online_player_audio_info/presentation/online_player_audio_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class OnlinePlayerDiskImage extends HookWidget {
  final Audio audio;

  const OnlinePlayerDiskImage({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.width / 2;
    final description = audio.description;

    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DiskPlayerImage(image: audio.image),
          if (description != null)
            Positioned(
              top: 0,
              right: 0,
              child: OnlinePlayerAudioInfo(description: description),
            ),
        ],
      ),
    );
  }
}
