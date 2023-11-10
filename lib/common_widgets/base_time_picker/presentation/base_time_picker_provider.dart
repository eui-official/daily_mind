import 'dart:async';

import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/time.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_time_picker/domain/base_time_picker_state.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseTimePickerNotifier extends StateNotifier<BaseTimePickerState> {
  Timer? timer;
  final DailyMindBackgroundHandler backgroundHandler;

  BaseTimePickerNotifier({
    required this.backgroundHandler,
  }) : super(const BaseTimePickerState());

  void onStartTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (currentTimer) {
      if (onIsBefore(time)) {
        state = state.copyWith(time: empty);
        timer?.cancel();
      }
    });
  }

  void onUpdateTimer(Time time) {
    state = state.copyWith(time: time);

    onStartTimer(time);
    backgroundHandler.onStartTimer(time);
  }

  void onDeletedTimer() {
    timer?.cancel();
    state = state.copyWith(time: empty);

    backgroundHandler.onDeletedTimer();
  }
}

final baseTimePickerProvider =
    StateNotifierProvider<BaseTimePickerNotifier, BaseTimePickerState>((ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

  return BaseTimePickerNotifier(
    backgroundHandler: baseBackgroundHandler,
  );
});
