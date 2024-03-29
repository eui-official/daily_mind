import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_content_player.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_toggle_button.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_title_player.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseMiniPlayer extends HookConsumerWidget {
  final bool isLoading;
  final bool isPlaying;
  final String subtitle;
  final String title;
  final VoidCallback onPause;
  final VoidCallback onPlay;
  final VoidCallback? onTap;
  final Widget leading;

  const BaseMiniPlayer({
    super.key,
    required this.isLoading,
    required this.isPlaying,
    required this.leading,
    required this.onPause,
    required this.onPlay,
    required this.title,
    this.onTap,
    this.subtitle = kEmptyString,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = useMemoized(() {
      return Container(
        height: spacing(7),
        padding: EdgeInsets.symmetric(horizontal: spacing(2)),
        child: BaseInkWell(
          onTap: onTap,
          borderRadius: circularRadius(2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: circularRadius(2),
              color: context.theme.primaryColorDark,
            ),
            child: Row(
              children: space(
                [
                  Container(
                    padding: EdgeInsets.only(left: spacing()),
                    child: BaseAnimatedSwitcher(
                      key: ValueKey(leading.hashCode),
                      child: leading,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: spacing()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: space(
                          [
                            if (title.isNotEmpty)
                              BaseMiniTitlePlayer(title: title),
                            BaseMiniPlayerContent(subtitle: subtitle),
                          ],
                          height: spacing(0.5),
                        ),
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
      );
    }, [
      isLoading,
      isPlaying,
      leading,
      onPause,
      onPlay,
      onTap,
      subtitle,
      title,
    ]);

    return child;
  }
}
