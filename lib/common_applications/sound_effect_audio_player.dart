import 'package:just_audio/just_audio.dart';

class SoundEffectAudioPlayer {
  final levelUpPlayer = AudioPlayer();

  SoundEffectAudioPlayer() {
    levelUpPlayer.setAudioSource(
      AudioSource.asset('assets/audios/sound-effects/level_up.mp3'),
    );
  }

  void onPlayLevelUp() {
    levelUpPlayer.seek(Duration.zero);
    levelUpPlayer.play();
  }
}

SoundEffectAudioPlayer soundEffectAudioPlayer = SoundEffectAudioPlayer();
