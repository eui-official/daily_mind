import 'package:daily_mind/features/favorite_sounds/domain/sound_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SoundCardItem extends StatelessWidget {
  final SoundCard soundCard;

  const SoundCardItem({
    super.key,
    required this.soundCard,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(spacing(3)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(soundCard.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Positioned(
            left: spacing(2),
            bottom: spacing(2),
            child: Text(
              soundCard.name,
              style: context.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
