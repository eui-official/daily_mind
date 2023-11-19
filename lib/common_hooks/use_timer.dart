import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Duration useTimer(WidgetRef ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
  final timerRemaining =
      useStream(baseBackgroundHandler.onStreamTimerRemaining);
  final remaining = timerRemaining.data ?? Duration.zero;

  return remaining;
}
