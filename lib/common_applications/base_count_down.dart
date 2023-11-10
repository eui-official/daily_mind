import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';

class BaseCountdown {
  PausableTimer? timer;

  void onStart({
    required int seconds,
    required Duration duration,
    required OnCounting onCounting,
    VoidCallback? onFinished,
  }) {
    timer = PausableTimer.periodic(duration, () {
      final remainingSeconds = --seconds;

      if (remainingSeconds >= 0) {
        onCounting(remainingSeconds);
      } else {
        onFinished?.call();
        timer?.cancel();
      }
    });

    timer?.start();
  }

  void onPause() {
    timer?.pause();
  }

  void onResume() {
    timer?.start();
  }

  void onCancel() {
    timer?.cancel();
  }
}
