import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/sound_icons_row/presentation/sound_icons_stack.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ListPlaylistItem extends StatelessWidget {
  final List<PlaylistItem> items;

  const ListPlaylistItem({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final names = items.map((item) => item.id.soundItem.name).join(', ');

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing(2)),
        color: Colors.white12,
      ),
      padding: EdgeInsets.all(spacing(2)),
      margin: EdgeInsets.only(bottom: spacing()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                names,
                style: context.textTheme.labelLarge,
              ),
              Container(
                padding: EdgeInsets.only(top: spacing(2)),
                child: SoundIconsStack(
                  ids: items.map((e) => e.id).toList(),
                  iconSize: 4,
                ),
              ),
            ],
          ),
          Icon(
            Icons.play_circle_fill_outlined,
            size: spacing(5),
            color: context.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
