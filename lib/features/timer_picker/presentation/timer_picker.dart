import 'dart:io';

import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerPicker extends HookConsumerWidget {
  const TimerPicker({
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
                onChange: playMixNotifier.updateTimer,
                is24HrFormat: true,
                iosStylePicker: Platform.isIOS,
              ),
            );
          },
          child: Text(display),
        ),
      ),
    );
  }
}
