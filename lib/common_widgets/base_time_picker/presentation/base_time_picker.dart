import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_hooks/use_timer.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseTimerPicker extends HookConsumerWidget {
  final EdgeInsetsGeometry? padding;

  const BaseTimerPicker({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final remaining = useTimer(ref);

    final title = useMemoized(() {
      if (remaining == Duration.zero) {
        return 'pickTime'.tr();
      }

      return dateFormatter.onFormatDuration(remaining);
    }, [remaining]);

    final onOpenTimer = useCallback(() async {
      if (remaining != Duration.zero) {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: 'Bạn có muốn xóa thời gian hiện tại?'.tr(),
        );

        if (result == OkCancelResult.ok) {
          baseBackgroundHandler.onDeletedTimer();
        }
      } else {
        final selectedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );

        onSafeValueBuilder(selectedTime, (value) {
          baseBackgroundHandler.onStartTimer(value);
        });
      }
    }, [remaining]);

    return Container(
      padding: padding,
      child: BaseIconButtonWithTitle(
        onPressed: onOpenTimer,
        icon: const Icon(Icons.av_timer),
        style: IconButton.styleFrom(
          backgroundColor: context.theme.primaryColorDark,
        ),
        title: title,
      ),
    );
  }
}
