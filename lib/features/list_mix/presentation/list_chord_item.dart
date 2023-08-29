import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix.dart';
import 'package:daily_mind/features/sound_icons_row/presentation/sound_icons_stack.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ListChordItem extends StatelessWidget {
  final Playlist playlist;

  const ListChordItem({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    final items = playlist.items ?? [];
    final names = items.map((item) => item.id.soundItem.name).join(', ');

    return ClipRRect(
      borderRadius: BorderRadius.circular(spacing(2)),
      child: Material(
        color: Colors.white12,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return PlayMix(playlistId: playlist.id);
                },
              ),
            );
          },
          child: Container(
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
          ),
        ),
      ),
    );
  }
}
