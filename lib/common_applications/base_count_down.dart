import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';

class BaseCountDown {
  late PausableTimer timer;

  onCountDown({
    required int seconds,
    required Duration duration,
    required OnCounting onCounting,
    VoidCallback? onFinished,
  }) {
    timer = PausableTimer.periodic(duration, () {
      final remainingSeconds = seconds - timer.tick;

      if (remainingSeconds >= 0) {
        onCounting(remainingSeconds);
      } else {
        onFinished?.call();
        timer.cancel();
      }
    });

    timer.start();
  }

  onPause() {
    timer.pause();
  }

  onResume() {
    timer.start();
  }
}
