import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_keys.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_tasks.dart';
import 'package:daily_mind/common_widgets/base_showcase/presentation/base_showcase.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/focus_mode_task_list/presentation/focus_mode_task_list.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcaseview/showcaseview.dart';

class FocusModeTaskSelector extends HookConsumerWidget {
  final String title;

  const FocusModeTaskSelector({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNavigationBarState = ref.watch(appNavigationBarProvider);

    final onShowListTask = useCallback(
      () {
        onShowScrollableBottomSheet(
          context,
          initialChildSize: 0.75,
          builder: (context, scrollController) => FocusModeTaskList(
            scrollController: scrollController,
          ),
        );
      },
      [],
    );

    useEffectDelayed(() {
      if (db.onIsFirstTime(kFocusModeChangeTaskTutorial) &&
          appNavigationBarState.isFocusModeScreen) {
        ShowCaseWidget.of(context).startShowCase(
          [
            focusModeChangeTaskKey,
          ],
        );
      }
    }, [context, appNavigationBarState]);

    return ElevatedButton(
      onPressed: onShowListTask,
      child: BaseShowcase(
        showcaseKey: focusModeChangeTaskKey,
        description: 'Bạn có thể thay đổi nhiệm vụ bằng cách bấm vào đây'.tr(),
        child: Container(
          padding: EdgeInsets.all(spacing()),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: space(
              [
                Text(
                  title,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
              width: spacing(),
            ),
          ),
        ),
      ),
    );
  }
}
