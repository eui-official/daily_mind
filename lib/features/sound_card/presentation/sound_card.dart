import 'package:daily_mind/common_domains/sound_offline_item.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_item_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoundCard extends HookWidget {
  final bool isPlaying;
  final bool isSelected;
  final SoundOfflineItem soundOfflineItem;
  final ValueChanged<dynamic> onSelected;
  final ValueChanged<dynamic> onDeleted;
  final Key? backgroundKey;

  const SoundCard({
    super.key,
    required this.isPlaying,
    required this.isSelected,
    required this.onSelected,
    required this.soundOfflineItem,
    required this.onDeleted,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context) {
    final onTap = useCallback(
      () {
        onSelected(soundOfflineItem);
      },
      [soundOfflineItem],
    );

    return BaseSoundCard(
      isPlaying: isPlaying,
      isSelected: isSelected,
      onDeleted: () {
        onDeleted(soundOfflineItem.id);
      },
      image: SoundCardItemBackground(
        key: backgroundKey,
        imageProvider: AssetImage(soundOfflineItem.image),
      ),
      name: soundOfflineItem.name.tr(),
      onTap: onTap,
    );
  }
}
