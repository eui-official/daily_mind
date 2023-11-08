import 'dart:async';

import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';

class BaseCountDown {
  onCountDown({
    required int seconds,
    required Duration duration,
    required OnCounting onCounting,
    VoidCallback? onFinished,
  }) {
    Timer.periodic(duration, (timer) {
      final remainingSeconds = seconds - timer.tick;

      if (remainingSeconds >= 0) {
        onCounting(remainingSeconds);
      } else {
        onFinished?.call();
        timer.cancel();
      }
    });
  }
}

final baseCountDown = BaseCountDown();
