import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/constants/offline_audios.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_list_audio_minimal_provider.g.dart';

@riverpod
class OfflineListAudioMinimalNotifier
    extends _$OfflineListAudioMinimalNotifier {
  GaplessAudioPlayer gaplessAudioPlayer = GaplessAudioPlayer();

  @override
  int build() {
    ref.onDispose(() {
      gaplessAudioPlayer.dispose();
    });

    return -1;
  }

  bool get isSelected => state > -1;

  void onSelected(int newIndex) async {
    final audio = offlineAudios[newIndex];
    await gaplessAudioPlayer.onSetSource(audio.id);

    if (newIndex == state) {
      gaplessAudioPlayer.pause();
      state = -1;
    } else {
      gaplessAudioPlayer.play();
      state = newIndex;
    }
  }
}
