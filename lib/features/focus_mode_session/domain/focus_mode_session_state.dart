import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_mode_session_state.freezed.dart';

@freezed
class FocusModeSessionState with _$FocusModeSessionState {
  const FocusModeSessionState._();

  const factory FocusModeSessionState({
    required bool isPlaying,
  }) = _FocusModeSessionState;
}
