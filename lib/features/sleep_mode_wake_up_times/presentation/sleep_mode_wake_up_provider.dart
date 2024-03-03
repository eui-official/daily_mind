import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_wake_up_provider.g.dart';

@riverpod
class SleepModeWakeUpNotifier extends _$SleepModeWakeUpNotifier {
  @override
  int build() => 0;

  void onUpdateIndex(int index) {
    state = index;
  }
}
