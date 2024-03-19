import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_mode_wake_up_audios_state.freezed.dart';

@freezed
class SleepModeWakeUpAudiosState with _$SleepModeWakeUpAudiosState {
  const factory SleepModeWakeUpAudiosState({
    required OfflineAudio wakeUpOfflineAudio,
  }) = _SleepModeWakeUpAudiosState;
}
