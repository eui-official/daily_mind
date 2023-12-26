import 'package:daily_mind/common_domains/audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_audio_ids_state.freezed.dart';

@freezed
class BaseAudioIdsState with _$BaseAudioIdsState {
  const factory BaseAudioIdsState({
    required List<Audio> audios,
  }) = _BaseAudioIdsState;
}
