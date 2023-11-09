import 'package:just_audio/just_audio.dart';

class SoundEffectAudioPlayer {
  final dingPlayer = AudioPlayer();
  final levelUpPlayer = AudioPlayer();

  SoundEffectAudioPlayer() {
    dingPlayer.setAudioSource(
      AudioSource.asset('assets/audios/sound-effects/ding.mp3'),
    );

    levelUpPlayer.setAudioSource(
      AudioSource.asset('assets/audios/sound-effects/level_up.mp3'),
    );
  }

  void onPlayDing() async {
    await dingPlayer.seek(Duration.zero);
    await dingPlayer.play();
  }

  void onPlayLevelUp() async {
    await levelUpPlayer.seek(Duration.zero);
    await levelUpPlayer.play();
  }
}

SoundEffectAudioPlayer soundEffectAudioPlayer = SoundEffectAudioPlayer();
