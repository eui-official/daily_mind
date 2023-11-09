part of 'base_audio_handler.dart';

extension BaseAudioOnHold on DailyMindBackgroundHandler {
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
