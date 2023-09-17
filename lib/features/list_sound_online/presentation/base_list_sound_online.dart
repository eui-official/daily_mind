import 'package:daily_mind/common_domains/sound.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_online.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class BaseListSoundOnline extends StatelessWidget {
  final List<Sound> items;
  final List<int> selectedIds;
  final String title;
  final int? selectingId;
  final ValueChanged<int> onDeleted;
  final ValueChanged<int> onSelected;
  final Widget headerTrailing;

  const BaseListSoundOnline({
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
                final sound = items[index];
                final isPlaying = sound.id == selectingId;
                final isSelected = selectedIds.contains(sound.id);

                return SoundCardOnline(
                  backgroundKey: index == 0 ? soundKey : ValueKey(sound.id),
                  isPlaying: isPlaying,
                  isSelected: isSelected,
                  onSelected: onSelected,
                  onDeleted: onDeleted,
                  sound: sound,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
