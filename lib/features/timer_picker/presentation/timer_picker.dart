import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_provider.dart';
import 'package:daily_mind/theme/theme.dart';
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

      return time?.format(context) ?? 'Chọn giờ';
    }, [playBackState.time]);

    return BaseContentHeader(
      title: 'Hẹn giờ tắt',
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
              ),
            );
          },
          child: Text(display),
        ),
      ),
    );
  }
}
