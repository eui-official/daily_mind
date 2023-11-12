import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/constants/offline_audios.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_list_audio_minimal_provider.g.dart';

@riverpod
class OfflineListAudioMinimalNotifier
    extends _$OfflineListAudioMinimalNotifier {
  GaplessAudioPlayer minimalGaplessAudioPlayer = GaplessAudioPlayer();

  @override
  int build() {
    ref.onDispose(() {
      minimalGaplessAudioPlayer.onDispose();
    });

    return -1;
  }

  bool get isSelected => state > -1;

  void onSelected(int newIndex) async {
    final audio = offlineAudios[newIndex];
    await minimalGaplessAudioPlayer.onSetSource(audio.id);

    if (newIndex == state) {
      minimalGaplessAudioPlayer.pause();
      state = -1;
    } else {
      minimalGaplessAudioPlayer.play();
      state = newIndex;
    }
  }
}
