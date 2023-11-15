import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/features/audio_card/presentation/audio_card_content.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseAudioCard extends StatelessWidget {
  final bool isSelected;
  final Key? backgroundKey;
  final String name;
  final VoidCallback onTap;
  final ImageProvider image;

  const BaseAudioCard({
    super.key,
    required this.image,
    required this.isSelected,
    required this.name,
    required this.onTap,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: circularRadius(2),
            border: Border.all(
              width: 3,
              color:
                  isSelected ? context.theme.primaryColor : Colors.transparent,
            ),
          ),
          child: BaseCard(
            image: image,
            onTap: onTap,
            content: AudioCardContent(name: name),
          ),
        ),
      ],
    );
  }
}
