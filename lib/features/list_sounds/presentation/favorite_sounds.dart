import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/list_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ListSounds extends StatelessWidget {
  final String? selectingId;
  final List<String> selectedIds;
  final ValueChanged<String> onSelected;
  final Widget headerTrailing;

  const ListSounds({
    super.key,
    this.selectingId,
    this.headerTrailing = emptyWidget,
    required this.selectedIds,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListHeader(
          trailing: headerTrailing,
          child: Text(
            'Âm thanh',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
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
              final isSelected = selectedIds.contains(soundItem.id);

              return SoundCardItem(
                isPlaying: isPlaying,
                isSelected: isSelected,
                onSelected: onSelected,
                soundItem: soundItem,
              );
            },
          ),
        ),
      ],
    );
  }
}
