import 'package:daily_mind/common_widgets/base_background_gradient.dart';
import 'package:daily_mind/features/list_sounds/domain/sound_card.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_background.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_content.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_selected_state.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoundCardItem extends HookWidget {
  final bool isPlaying;
  final bool isSelected;
  final SoundItem soundItem;
  final ValueChanged<String> onSelected;

  const SoundCardItem({
    super.key,
    required this.isPlaying,
    required this.isSelected,
    required this.onSelected,
    required this.soundItem,
  });

  @override
  Widget build(BuildContext context) {
    final onTap = useCallback(
      () {
        onSelected(soundItem.id);
      },
      [soundItem.id],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(spacing(2)),
      child: Stack(
        children: [
          SoundCardItemBackground(image: soundItem.image),
          const BaseBackgroundGradient(),
          Positioned(
            bottom: spacing(2),
            left: 0,
            right: 0,
            child: SoundCardItemContent(
              name: soundItem.name,
              isPlaying: isPlaying,
            ),
          ),
          if (isSelected) const SoundCardItemSelectedState(),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
