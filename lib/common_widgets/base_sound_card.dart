import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_content.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_delete_button.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseSoundCard extends StatelessWidget {
  final bool isLoading;
  final bool isPlaying;
  final bool isSelected;
  final Key? backgroundKey;
  final String name;
  final VoidCallback onDeleted;
  final VoidCallback onTap;
  final ImageProvider image;

  const BaseSoundCard({
    super.key,
    required this.image,
    required this.isLoading,
    required this.isPlaying,
    required this.isSelected,
    required this.name,
    required this.onDeleted,
    required this.onTap,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(spacing(2)),
            border: Border.all(
              width: 2,
              color:
                  isSelected ? context.theme.primaryColor : Colors.transparent,
            ),
          ),
          child: BaseCard(
            image: image,
            imageHeight: miniImageHeight,
            onTap: onTap,
            child: Stack(
              children: [
                SoundCardContent(
                  name: name,
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
        if (isSelected) SoundCardDeleteButton(onPressed: onDeleted),
      ],
    );
  }
}
