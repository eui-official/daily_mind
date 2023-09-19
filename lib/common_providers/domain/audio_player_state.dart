import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_player_state.freezed.dart';

@freezed
class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    required bool isPlaying,
    required bool isLoading,
  }) = _AudioPlayerState;
}
