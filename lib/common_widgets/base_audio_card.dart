import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/features/audio_card/presentation/audio_card_content.dart';
import 'package:flutter/material.dart';

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
    return BaseCard(
      image: image,
      onTap: onTap,
      content: AudioCardContent(name: name),
    );
  }
}
