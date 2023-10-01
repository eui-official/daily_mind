import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_widgets/base_mix_editor_item.dart';
import 'package:daily_mind/constants/sound_items.dart';
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
    final soundItem = soundOfflineItems
        .firstWhere((item) => item.id == offlineMixEditorItemState.id);

    final playingSnapshot = useStream(player.playingStream);
    final isPlaying = playingSnapshot.data ?? false;

    final onInit = useCallback(
      () {
        player.onSetSource(offlineMixEditorItemState.id);
        player.onSetVolume(offlineMixEditorItemState.volume);
        player.onPlay();
      },
      [],
    );

    final onVolumeChanged = useCallback(
      (double volume) {
        player.onSetVolume(volume);
        onItemVolumeChanged(offlineMixEditorItemState, volume);
      },
      [player, offlineMixEditorItemState],
    );

    useEffect(() {
      onInit();

      return player.onDispose;
    }, []);

    return BaseMixEditorItem(
      volumeKey: volumeKey,
      image: soundItem.image,
      initVolume: offlineMixEditorItemState.volume,
      name: soundItem.name.tr(),
      onVolumeChanged: onVolumeChanged,
      prefixChild: TogglePlayModeButton(
        isPlaying: isPlaying,
        onPause: player.onPause,
        onPlay: player.onPlay,
      ),
    );
  }
}
