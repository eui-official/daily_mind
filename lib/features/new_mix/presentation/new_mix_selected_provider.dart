import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/live_audio_player.dart';
import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/common_domains/sound_offline_item.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/domain/new_mix_selected.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final yt = YoutubeExplode();

class NewMixSelectedNotifier extends StateNotifier<NewMixSelected> {
  final player = GaplessAudioPlayer();
  final livePlayer = LiveAudioPlayer();

  NewMixSelectedNotifier()
      : super(
          const NewMixSelected(
            selectedIds: [],
            selectingId: emptyString,
          ),
        );

  void onSelected(dynamic data) {
    if (state.selectingId == data.id) {
      onResetSelectingId();
    } else {
      state = state.copyWith(selectingId: data.id);

      if (data is SoundOfflineItem) {
        onPlayOfflineSound(data.id);
      } else if (data is SoundOnlineItem) {
        if (data.isLive) {
          onPlayLiveOnlineSound(data.source);
        }
      }
    }
  }

  void onDeleted(dynamic id) {
    final cloneSelectedIds = List<String>.from(state.selectedIds);
    cloneSelectedIds.remove(id);

    state = state.copyWith(selectedIds: cloneSelectedIds);
  }

  void onResetSelectingId() {
    state = state.copyWith(selectingId: emptyString);
    player.stop();
    livePlayer.stop();
  }

  void onPlayOfflineSound(String id) {
    player.setSource(id);
    player.play();
  }

  void onPlayLiveOnlineSound(String source) async {
    final url = await yt.videos.streams.getHttpLiveStreamUrl(VideoId(source));
    livePlayer.play(url);
  }

  void onAddCurrentId() {
    final newSelectedIds = List<String>.from(state.selectedIds);
    newSelectedIds.add(state.selectingId);

    state = state.copyWith(selectedIds: newSelectedIds);

    onResetSelectingId();
  }
}

final newMixSelectedProvider =
    StateNotifierProvider<NewMixSelectedNotifier, NewMixSelected>((ref) {
  return NewMixSelectedNotifier();
});
