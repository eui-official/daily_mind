import 'package:collection/collection.dart';
import 'package:daily_mind/common_widgets/base_backdrop_filter.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
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
  final String subtitle;
  final VoidCallback onPause;
  final VoidCallback onPlay;
  final VoidCallback? onTap;
  final Widget leading;

  const BaseMiniPlayer({
    super.key,
    required this.leading,
    required this.isLoading,
    required this.isPlaying,
    required this.onPause,
    required this.onPlay,
    required this.title,
    this.subtitle = emptyString,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: spacing(6),
      margin: EdgeInsets.symmetric(
        vertical: kBottomNavigationBarHeight * 1.75,
        horizontal: spacing(2),
      ),
      child: BaseBackdropFilter(
        borderRadius: circularRadius(),
        child: Container(
          color: context.theme.primaryColor.withOpacity(0.25),
          child: BaseInkWell(
            onTap: onTap,
            borderRadius: circularRadius(),
            child: Row(
              children: space(
                [
                  AnimatedSwitcher(
                    key: ValueKey(leading.hashCode),
                    duration: defaultDuration,
                    child: leading,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: space(
                        [
                          SizedBox(
                            height: spacing(2),
                            child: BaseMarquee(
                              text: title,
                              style: context.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (subtitle.isNotEmpty)
                            Text(
                              subtitle,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: secondaryTextColor,
                              ),
                            )
                        ].whereNotNull().toList(),
                        height: spacing(0.5),
                      ),
                    ),
                  ),
                  BaseMiniPlayerToggleButton(
                    isLoading: isLoading,
                    isPlaying: isPlaying,
                    onPause: onPause,
                    onPlay: onPlay,
                  ),
                ],
                width: spacing(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
