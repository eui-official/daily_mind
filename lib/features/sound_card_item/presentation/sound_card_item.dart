import 'package:daily_mind/common_widgets/base_background_gradient.dart';
import 'package:daily_mind/features/list_sounds/domain/sound_card.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_background.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_content.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_delete_button.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_overlay.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_selected_state.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoundCardItem extends HookWidget {
  final bool isPlaying;
  final bool isSelected;
  final SoundItem soundItem;
  final ValueChanged<String> onSelected;
  final ValueChanged<String> onDeleted;

  const SoundCardItem({
    super.key,
    required this.isPlaying,
    required this.isSelected,
    required this.onSelected,
    required this.soundItem,
    required this.onDeleted,
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
          SoundCardItemContent(
            name: soundItem.name,
            isPlaying: isPlaying,
          ),
          SoundCardItemOverlay(onTap: onTap),
          if (isSelected) const SoundCardItemSelectedState(),
          if (isSelected)
            SoundCardItemDeleteButton(onPressed: () => onDeleted(soundItem.id)),
        ],
      ),
    );
  }
}
