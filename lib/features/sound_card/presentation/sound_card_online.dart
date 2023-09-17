import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/sound.dart';
import 'package:daily_mind/common_widgets/base_background_gradient.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_content.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_delete_button.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_overlay.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_selected_state.dart';
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(spacing(2)),
      child: SizedBox(
        width: spacing(15),
        child: Stack(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              height: spacing(20),
              imageUrl: sound.image,
            ),
            const BaseBackgroundGradient(),
            SoundCardContent(
              name: sound.name,
              isPlaying: isPlaying,
            ),
            SoundCardOverlay(onTap: onTap),
            if (isSelected) const SoundCardSelectedState(),
            if (isSelected)
              SoundCardDeleteButton(onPressed: () => onDeleted(sound.id)),
          ],
        ),
      ),
    );
  }
}
