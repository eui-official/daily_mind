import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_icon/presentation/play.dart';
import 'package:daily_mind/common_widgets/base_shadow.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/focus_icons.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_session/presentation/focus_mode_session.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item_avatar.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item_working_session.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeTaskItem extends HookConsumerWidget {
  final Pomodoro pomodoro;

  const FocusModeTaskItem({
    super.key,
    required this.pomodoro,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final focusIcon =
        focusIcons.firstWhere((icon) => icon.id == pomodoro.iconId);

    final onOpenPomodoro = useCallback(
      () async {
        baseBackgroundHandler.onHold();
        baseBackgroundHandler.onTaskInit(pomodoro);

        await onShowBottomSheet(
          context,
          child: const FocusModeSession(),
          isScrollControlled: true,
          isDismissible: false,
          enableDrag: false,
        );

        baseBackgroundHandler.onStopHolding();
      },
      [context, pomodoro],
    );

    return BaseShadow(
      borderRadius: circularRadius(2),
      color: context.theme.highlightColor,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onOpenPomodoro,
          child: Container(
            height: spacing(10),
            padding: EdgeInsets.all(spacing(2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: space(
                    [
                      FocusModeTaskItemAvatar(icon: focusIcon.icon),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pomodoro.title ?? emptyString,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FocusModeTaskItemWorkingSession(
                            workingSessions: pomodoro.workingSessions ?? 0,
                          )
                        ],
                      )
                    ],
                    width: spacing(2),
                  ),
                ),
                const PlayIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
