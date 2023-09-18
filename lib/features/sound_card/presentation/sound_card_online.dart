import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/sound.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoundCardOnline extends HookWidget {
  final bool isPlaying;
  final bool isSelected;
  final Sound sound;
  final ValueChanged<dynamic> onSelected;
  final ValueChanged<dynamic> onDeleted;
  final Key? backgroundKey;

  const SoundCardOnline({
    super.key,
    required this.isPlaying,
    required this.isSelected,
    required this.onSelected,
    required this.sound,
    required this.onDeleted,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context) {
    final onTap = useCallback(
      () {
        onSelected(sound);
      },
      [sound],
    );

    return BaseSoundCard(
      image: CachedNetworkImage(
        fit: BoxFit.cover,
        height: spacing(20),
        imageUrl: sound.image,
      ),
      isPlaying: isPlaying,
      isSelected: isSelected,
      name: sound.name,
      onDeleted: () => onDeleted(sound.id),
      onTap: onTap,
    );
  }
}
