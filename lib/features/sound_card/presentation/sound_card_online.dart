import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoundCardOnline extends HookWidget {
  final bool isPlaying;
  final bool isSelected;
  final SoundOnlineItem soundOnlineItem;
  final ValueChanged<dynamic> onSelected;
  final ValueChanged<dynamic> onDeleted;
  final Key? backgroundKey;

  const SoundCardOnline({
    super.key,
    required this.isPlaying,
    required this.isSelected,
    required this.onSelected,
    required this.soundOnlineItem,
    required this.onDeleted,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context) {
    final onTap = useCallback(
      () {
        onSelected(soundOnlineItem);
      },
      [soundOnlineItem],
    );

    return BaseSoundCard(
      image: CachedNetworkImage(
        fit: BoxFit.cover,
        height: spacing(20),
        imageUrl: soundOnlineItem.image,
      ),
      isPlaying: isPlaying,
      isSelected: isSelected,
      name: soundOnlineItem.name,
      onDeleted: () => onDeleted(soundOnlineItem.id),
      onTap: onTap,
    );
  }
}
