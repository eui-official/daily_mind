import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/sleep_mode_current_time/presentation/sleep_mode_current_time.dart';
import 'package:daily_mind/features/sleep_mode_form/presentation/sleep_mode_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepMode extends HookWidget {
  const SleepMode({super.key});

  @override
  Widget build(BuildContext context) {
    final greeting = useMemoized(() {
      final hour = DateTime.now().toUtc().hour;

      if (hour < 12) {
        return 'Chào buổi sáng';
      }
      if (hour < 17) {
        return 'Chào buổi trưa';
      }
      return 'Chào buổi tối';
    }, []);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AppBarScrollview(
            title: greeting,
            children: const [
              SleepModeCurrentTime(),
              SleepModeForm(),
            ],
          ),
        ],
      ),
    );
  }
}
