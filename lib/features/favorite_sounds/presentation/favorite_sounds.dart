import 'package:daily_mind/features/favorite_sounds/constant/sound_cards.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class FavoriteSounds extends StatelessWidget {
  final ValueChanged<String> onSelected;
  final String? selectingId;

  const FavoriteSounds({
    super.key,
    this.selectingId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chọn gói âm thanh',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: spacing(4)),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: soundCards.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: spacing(2),
                crossAxisSpacing: spacing(2),
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final soundCard = soundCards[index];
                final isPlaying = soundCard.id == selectingId;

                return SoundCardItem(
                  isPlaying: isPlaying,
                  onSelected: onSelected,
                  soundCard: soundCard,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
