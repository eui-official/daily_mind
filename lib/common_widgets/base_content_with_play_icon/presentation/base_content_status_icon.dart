import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/music_playing/presentation/music_playing.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class BaseContentStatusIcon extends HookWidget {
  final bool isPlaying;

  const BaseContentStatusIcon({
    super.key,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final child = useMemoized(() {
      if (isPlaying) {
        return const MusicPlaying();
      }

      return Icon(
        Icons.play_circle_fill_outlined,
        size: spacing(5),
        color: context.theme.primaryColor,
      );
    }, [isPlaying]);

    return AnimatedSwitcher(
      duration: defaultDuration,
      child: child,
    );
  }
}
