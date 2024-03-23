import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_audios/domain/sleep_mode_wake_up_audios_available_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sleep_mode_wake_up_audios_available_provider.g.dart';

final initState = SleepModeWakeUpAudiosAvailableState(
  gaplessAudioPlayer: GaplessAudioPlayer(),
);

@riverpod
class SleepModeWakeUpAudiosAvailableNotifier
    extends _$SleepModeWakeUpAudiosAvailableNotifier {
  @override
  SleepModeWakeUpAudiosAvailableState build() {
    return initState;
  }

  void onPlaySound(OfflineAudio offlineAudio) {
    state = state.copyWith(currentWakeUpOfflineAudio: offlineAudio);
    state.gaplessAudioPlayer.onSetSource(offlineAudio);
  }

  void onStopSound() {
    state.gaplessAudioPlayer.pause();
    state = initState;
  }
}
