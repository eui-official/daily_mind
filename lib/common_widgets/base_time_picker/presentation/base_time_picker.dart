import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseTimerPicker extends HookConsumerWidget {
  const BaseTimerPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playBackState = ref.watch(playMixProvider);
    final playMixNotifier = ref.read(playMixProvider.notifier);

    final display = useMemoized(() {
      final time = playBackState.time;

      return time?.format(context) ?? 'pickTime'.tr();
    }, [playBackState.time]);

    return BaseContentHeader(
      title: 'turnOffTime'.tr(),
      child: Container(
        padding: EdgeInsets.only(top: spacing()),
        child: ElevatedButton(
          onPressed: () {
            final now = DateTime.now();

            Navigator.of(context).push(
              showPicker(
                context: context,
                value: Time(hour: now.hour, minute: now.minute),
                onChange: playMixNotifier.onUpdateTimer,
                is24HrFormat: true,
                cancelText: 'cancel'.tr(),
                okText: 'ok'.tr(),
                accentColor: context.theme.primaryColor,
              ),
            );
          },
          child: Text(display),
        ),
      ),
    );
  }
}
