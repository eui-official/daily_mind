import 'package:daily_mind/features/favorite_sounds/domain/sound_card.dart';
import 'package:daily_mind/features/music_playing/presentation/music_playing.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_background.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item_gradient.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class SoundCardItem extends HookWidget {
  final SoundCard soundCard;
  final bool isPlaying;
  final ValueChanged<String> onSelected;

  const SoundCardItem({
    super.key,
    required this.soundCard,
    required this.isPlaying,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final onTap = useCallback(
      () {
        onSelected(soundCard.id);
      },
      [soundCard.id],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(spacing(3)),
      child: Stack(
        children: [
          SoundCardItemBackground(image: soundCard.image),
          const SoundCardItemGradient(),
          Positioned(
            bottom: spacing(2),
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: spacing(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    soundCard.name,
                    style: context.textTheme.titleLarge,
                  ),
                  if (isPlaying) const MusicPlaying(),
                ],
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}
