import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_audio_player_index_state.freezed.dart';

@freezed
class OnlineAudioPlayerIndexState with _$OnlineAudioPlayerIndexState {
  const OnlineAudioPlayerIndexState._();

  const factory OnlineAudioPlayerIndexState({
    required int index,
    required int sequenceLength,
  }) = _OnlineAudioPlayerIndexState;

  int get nextIndex => index + 1;

  int get previousIndex => index - 1;

  int get firstIndex => 0;

  int get lastIndex => sequenceLength - 1;

  bool get isCanMoveNext {
    if (nextIndex < sequenceLength) {
      return true;
    }

    return false;
  }

  bool get isCanMovePrevious {
    if (previousIndex > 0) {
      return true;
    }

    return false;
  }
}
