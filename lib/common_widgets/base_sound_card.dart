import 'package:daily_mind/common_widgets/base_background_gradient.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_content.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_delete_button.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_overlay.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_selected_state.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseSoundCard extends StatelessWidget {
  final bool isPlaying;
  final bool isSelected;
  final VoidCallback onDeleted;
  final Key? backgroundKey;
  final Widget image;
  final String name;
  final VoidCallback onTap;

  const BaseSoundCard({
    super.key,
    required this.isPlaying,
    required this.isSelected,
    required this.onDeleted,
    required this.image,
    required this.name,
    required this.onTap,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(spacing(2)),
      child: SizedBox(
        width: spacing(20),
        child: Stack(
          children: [
            image,
            const BaseBackgroundGradient(),
            SoundCardContent(
              name: name,
              isPlaying: isPlaying,
            ),
            SoundCardOverlay(onTap: onTap),
            if (isSelected) const SoundCardSelectedState(),
            if (isSelected) SoundCardDeleteButton(onPressed: onDeleted),
          ],
        ),
      ),
    );
  }
}
