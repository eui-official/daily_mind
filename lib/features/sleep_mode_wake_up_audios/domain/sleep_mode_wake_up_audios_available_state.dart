import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_mode_wake_up_audios_available_state.freezed.dart';

@freezed
class SleepModeWakeUpAudiosAvailableState
    with _$SleepModeWakeUpAudiosAvailableState {
  const factory SleepModeWakeUpAudiosAvailableState({
    required GaplessAudioPlayer gaplessAudioPlayer,
    OfflineAudio? currentOfflineAudio,
  }) = _SleepModeWakeUpAudiosAvailableState;
}
