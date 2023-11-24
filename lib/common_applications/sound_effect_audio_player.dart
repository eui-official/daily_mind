import 'package:just_audio/just_audio.dart';

class SoundEffectAudioPlayer {
  final levelUpPlayer = AudioPlayer();
  final alarmPlayer = AudioPlayer();

  SoundEffectAudioPlayer() {
    levelUpPlayer.setAudioSource(
      AudioSource.asset('assets/audios/sound-effects/level_up.mp3'),
    );
    alarmPlayer.setAudioSource(
      AudioSource.asset('assets/audios/sound-effects/alarm.mp3'),
    );
  }

  void onPlayLevelUp() {
    levelUpPlayer.seek(Duration.zero);
    levelUpPlayer.play();
  }

  void onPlayAlarm() {
    alarmPlayer.seek(Duration.zero);
    alarmPlayer.play();
  }
}

SoundEffectAudioPlayer soundEffectAudioPlayer = SoundEffectAudioPlayer();
