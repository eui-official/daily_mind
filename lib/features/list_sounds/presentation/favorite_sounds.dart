import 'package:daily_mind/features/list_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ListSounds extends StatelessWidget {
  final String? selectingId;
  final ValueChanged<String> onSelected;

  const ListSounds({
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
              itemCount: soundItems.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: spacing(2),
                crossAxisSpacing: spacing(2),
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final soundItem = soundItems[index];
                final isPlaying = soundItem.id == selectingId;

                return SoundCardItem(
                  isPlaying: isPlaying,
                  onSelected: onSelected,
                  soundItem: soundItem,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
