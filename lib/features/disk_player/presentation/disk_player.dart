import 'package:daily_mind/features/disk_player/presentation/disk_player_circle.dart';
import 'package:daily_mind/features/disk_player/presentation/disk_player_pattern.dart';
import 'package:daily_mind/features/player_toggle_button/presentation/player_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class DiskPlayer extends StatelessWidget {
  final bool isPlaying;
  final ImageProvider image;

  const DiskPlayer({
    super.key,
    required this.isPlaying,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        DiskPlayerCircle(
          isPlaying: isPlaying,
          image: image,
        ),
        DiskPlayerPattern(
          color: context.theme.primaryColorDark.withOpacity(0.4),
          divideSize: 3,
        ),
        DiskPlayerPattern(
          color: context.theme.primaryColorDark.withOpacity(0.25),
          divideSize: 2,
        ),
        DiskPlayerPattern(
          color: context.theme.primaryColorDark.withOpacity(0.5),
          divideSize: 6,
        ),
        const PlayerToggleButton(),
      ],
    );
  }
}
