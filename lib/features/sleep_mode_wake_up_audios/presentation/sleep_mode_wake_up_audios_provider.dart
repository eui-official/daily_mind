import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/constants/offline_wake_up_audios.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_audios/domain/sleep_mode_wake_up_audios_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_wake_up_audios_provider.g.dart';

@riverpod
class SleepModeWakeUpAudiosNotifier extends _$SleepModeWakeUpAudiosNotifier {
  @override
  SleepModeWakeUpAudiosState build() {
    return SleepModeWakeUpAudiosState(
      wakeUpOfflineAudio: kOfflineWakeUpAudios.first,
    );
  }

  void onUpdateWakeUpOfflineAudio(OfflineAudio offlineAudio) {
    state = state.copyWith(wakeUpOfflineAudio: offlineAudio);
  }
}
