import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_widgets/base_background_gradient.dart';
import 'package:daily_mind/features/list_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:daily_mind/features/mix_editor_item/presentation/mix_editor_content.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/features/volume_slider/presentation/volume_slider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:daily_mind/types/commom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class MixEditorItem extends HookWidget {
  final MixEditorItemState itemState;
  final OnItemVolumeChanged onItemVolumeChanged;

  const MixEditorItem({
    super.key,
    required this.itemState,
    required this.onItemVolumeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final player = useMemoized(() => GaplessAudioPlayer());
    final soundItem = soundItems.firstWhere((item) => item.id == itemState.id);

    final onInit = useCallback(
      () {
        player.setSource(itemState.id);
        player.setVolume(itemState.volume);
        player.play();
      },
      [],
    );

    final onChanged = useCallback(
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

    return SizedBox(
      height: spacing(15),
      width: context.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacing(2)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(soundItem.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const BaseBackgroundGradient(),
            Container(
              padding: EdgeInsets.symmetric(vertical: spacing(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TogglePlayModeButton(player: player),
                      Expanded(
                        child: VolumeSlider(
                          onChanged: onChanged,
                          initVolume: itemState.volume,
                        ),
                      )
                    ],
                  ),
                  MixEditorContent(name: soundItem.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
