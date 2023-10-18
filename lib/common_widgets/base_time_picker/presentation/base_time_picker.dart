import 'package:daily_mind/common_widgets/base_chip.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_time_picker/presentation/base_time_picker_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
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
    final baseTimePickerState = ref.watch(baseTimePickerProvider);
    final baseTimePickerNotifier = ref.read(baseTimePickerProvider.notifier);

    final display = useMemoized(() {
      final time = baseTimePickerState.time;

      return time?.format(context) ?? 'pickTime'.tr();
    }, [context, baseTimePickerState.time]);

    final onDeleted = useMemoized(() {
      if (baseTimePickerState.time is Time) {
        return baseTimePickerNotifier.onDeletedTimer;
      } else {
        return empty;
      }
    }, [baseTimePickerState.time]);

    return Container(
      padding: padding,
      child: BaseContentHeader(
        title: 'turnOffTime'.tr(),
        child: Container(
          padding: EdgeInsets.only(top: spacing()),
          child: BaseChip(
            onPressed: () {
              final now = DateTime.now();

              Navigator.of(context).push(
                showPicker(
                  accentColor: context.theme.primaryColor,
                  blurredBackground: true,
                  cancelText: 'cancel'.tr(),
                  context: context,
                  iosStylePicker: true,
                  is24HrFormat: true,
                  okText: 'ok'.tr(),
                  onChange: baseTimePickerNotifier.onUpdateTimer,
                  unselectedColor: context.theme.disabledColor,
                  value: Time(
                    hour: baseTimePickerState.time?.hour ?? now.hour,
                    minute: baseTimePickerState.time?.minute ?? now.minute,
                  ),
                ),
              );
            },
            display: display,
            onDeleted: onDeleted,
          ),
        ),
      ),
    );
  }
}
