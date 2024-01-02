import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_music_playing/presentation/circular_music_playing.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
        return const CircularMusicPlaying();
      }

      return kEmptyWidget;
    }, [isPlaying]);

    return SizedBox(
      width: spacing(5),
      height: spacing(5),
      child: BaseAnimatedSwitcher(
        child: child,
      ),
    );
  }
}
