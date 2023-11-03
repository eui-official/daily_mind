import 'package:daily_mind/common_widgets/base_icon/presentation/play.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/common_widgets/base_icon/presentation/music_playing.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseContentStatusIcon extends HookWidget {
  final bool isPlaying;
  final Color? iconColor;

  const BaseContentStatusIcon({
    super.key,
    required this.isPlaying,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final child = useMemoized(() {
      if (isPlaying) {
        return MusicPlaying(color: iconColor);
      }

      return const PlayIcon();
    }, [isPlaying, iconColor]);

    return SizedBox(
      width: spacing(5),
      height: spacing(5),
      child: AnimatedSwitcher(
        duration: defaultDuration,
        child: child,
      ),
    );
  }
}
