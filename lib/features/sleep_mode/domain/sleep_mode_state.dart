import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_mode_state.freezed.dart';

@freezed
class SleepModeState with _$SleepModeState {
  const SleepModeState._();

  const factory SleepModeState({
    required OfflineAudio wakeUpOfflineAudio,
    required DateTime endTime,
  }) = _SleepModeState;

  String get wakeUpOfflineAudioPath => wakeUpOfflineAudio.sources.first;
}
