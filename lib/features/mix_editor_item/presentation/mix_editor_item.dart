import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_widgets/base_mix_editor_item.dart';
import 'package:daily_mind/features/list_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/types/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixEditorItem extends HookWidget {
  final MixEditorItemState itemState;
  final OnItemVolumeChanged onItemVolumeChanged;
  final Key? volumeKey;

  const MixEditorItem({
    super.key,
    required this.itemState,
    required this.onItemVolumeChanged,
    this.volumeKey,
  });

  @override
  Widget build(BuildContext context) {
    final player = useMemoized(() => GaplessAudioPlayer());
    final soundItem = soundItems.firstWhere((item) => item.id == itemState.id);

    final playingSnapshot = useStream(player.playingStream);
    final isPlaying = playingSnapshot.data ?? false;

    final onInit = useCallback(
      () {
        player.setSource(itemState.id);
        player.setVolume(itemState.volume);
        player.play();
      },
      [],
    );

    final onVolumeChanged = useCallback(
      (double volume) {
        player.setVolume(volume);
        onItemVolumeChanged(itemState, volume);
      },
      [player, itemState],
    );

    useEffect(() {
      onInit();

      return player.dispose;
    }, []);

    return BaseMixEditorItem(
      volumeKey: volumeKey,
      image: soundItem.image,
      initVolume: itemState.volume,
      name: soundItem.name.tr(),
      onVolumeChanged: onVolumeChanged,
      prefixChild: TogglePlayModeButton(
        isPlaying: isPlaying,
        onStop: player.stop,
        onPlay: player.play,
      ),
    );
  }
}
