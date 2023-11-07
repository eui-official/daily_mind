part of 'base_audio_handler.dart';

bool isPreviousPlaying = true;

extension BaseAudioOnHold on DailyMindAudioHandler {
  void onHold() {
    if (playbackState.value.playing) {
      pause();
    } else {
      isPreviousPlaying = false;
    }
  }

  void onStopHolding() {
    if (isPreviousPlaying) {
      play();
    } else {
      isPreviousPlaying = true;
    }
  }
}
