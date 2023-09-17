import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/list_sounds/domain/sound_card.dart';
import 'package:daily_mind/features/sound_card_item/presentation/sound_card_item.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class ListSounds extends StatelessWidget {
  final List<SoundItem> items;
  final List<String> selectedIds;
  final String title;
  final String? selectingId;
  final ValueChanged<String> onDeleted;
  final ValueChanged<String> onSelected;
  final Widget headerTrailing;

  const ListSounds({
    super.key,
    required this.items,
    required this.onDeleted,
    required this.onSelected,
    required this.selectedIds,
    required this.title,
    this.headerTrailing = emptyWidget,
    this.selectingId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListHeader(
          trailing: headerTrailing,
          child: Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Flexible(
          child: Container(
            height: spacing(20),
            padding: EdgeInsets.only(top: spacing(4)),
            child: ListView.separated(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: spacing()),
              itemBuilder: (context, index) {
                final soundItem = items[index];
                final isPlaying = soundItem.id == selectingId;
                final isSelected = selectedIds.contains(soundItem.id);

                return SoundCardItem(
                  backgroundKey: index == 0 ? soundKey : ValueKey(soundItem.id),
                  isPlaying: isPlaying,
                  isSelected: isSelected,
                  onSelected: onSelected,
                  onDeleted: onDeleted,
                  soundItem: soundItem,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
