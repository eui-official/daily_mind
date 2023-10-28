import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_audio_player_index_state.freezed.dart';

@freezed
class OnlineAudioPlayerIndexState with _$OnlineAudioPlayerIndexState {
  const OnlineAudioPlayerIndexState._();

  const factory OnlineAudioPlayerIndexState({
    required int index,
    required int sequenceLength,
  }) = _OnlineAudioPlayerIndexState;

  int get lastIndex => sequenceLength - 1;
}
