import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_toggle_button.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseMiniPlayer extends HookConsumerWidget {
  final bool isLoading;
  final bool isPlaying;
  final String title;
  final VoidCallback onPause;
  final VoidCallback onPlay;
  final VoidCallback? onTap;
  final Widget image;

  const BaseMiniPlayer({
    super.key,
    required this.image,
    required this.isLoading,
    required this.isPlaying,
    required this.onPause,
    required this.onPlay,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(spacing(2)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(spacing()),
          child: Container(
            height: spacing(8),
            padding: EdgeInsets.symmetric(horizontal: spacing()),
            decoration: BoxDecoration(
              color: context.theme.focusColor,
              borderRadius: BorderRadius.circular(spacing()),
            ),
            child: Row(
              children: space([
                AnimatedSwitcher(
                  key: ValueKey(image.hashCode),
                  duration: defaultDuration,
                  child: image,
                ),
                Flexible(
                  child: BaseMarquee(
                    text: title,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BaseMiniPlayerToggleButton(
                  isLoading: isLoading,
                  isPlaying: isPlaying,
                  onPause: onPause,
                  onPlay: onPlay,
                ),
              ], width: spacing(2)),
            ),
          ),
        ),
      ),
    );
  }
}
