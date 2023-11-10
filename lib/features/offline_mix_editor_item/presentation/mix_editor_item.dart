import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_widgets/base_mix_editor_item.dart';
import 'package:daily_mind/constants/offline_audios.dart';
import 'package:daily_mind/features/offline_mix_editor/domain/offline_mix_editor_item_state.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/types/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixEditorItem extends HookWidget {
  final OfflineMixEditorItemState offlineMixEditorItemState;
  final OnItemVolumeChanged onItemVolumeChanged;
  final Key? volumeKey;

  const MixEditorItem({
    super.key,
    required this.offlineMixEditorItemState,
    required this.onItemVolumeChanged,
    this.volumeKey,
  });

  @override
  Widget build(BuildContext context) {
    final player = useMemoized(() => GaplessAudioPlayer());
    final offlineAudio = offlineAudios
        .firstWhere((item) => item.id == offlineMixEditorItemState.id);

    final playingStreamMemoized = useMemoized(() => player.playingStream, []);

    final playingSnapshot = useStream(playingStreamMemoized);

    final isPlaying = playingSnapshot.data ?? false;

    final onInit = useCallback(
      () async {
        player.onSetSource(offlineMixEditorItemState.id);
        player.setVolume(offlineMixEditorItemState.volume);
        player.play();
      },
      [],
    );

    final onVolumeChanged = useCallback(
      (double volume) {
        player.setVolume(volume);
        onItemVolumeChanged(offlineMixEditorItemState, volume);
      },
      [player, offlineMixEditorItemState],
    );

    useEffect(() {
      onInit();

      return () {
        player.onDispose();
      };
    }, []);

    return BaseMixEditorItem(
      image: offlineAudio.image,
      initVolume: offlineMixEditorItemState.volume,
      name: offlineAudio.name.tr(),
      onVolumeChanged: onVolumeChanged,
      volumeKey: volumeKey,
      prefixChild: TogglePlayModeButton(
        isPlaying: isPlaying,
        onPause: player.pause,
        onPlay: player.play,
      ),
    );
  }
}
