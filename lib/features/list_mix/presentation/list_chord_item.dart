import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix.dart';
import 'package:daily_mind/features/sound_images_stack/presentation/sound_images_stack.dart';
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
    final title = playlist.title ?? emptyString;

    return ClipRRect(
      borderRadius: BorderRadius.circular(spacing(2)),
      child: Material(
        color: context.theme.colorScheme.background.withOpacity(0.4),
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
          child: Row(
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SoundImagesStack(items: items),
                    Container(
                      padding: EdgeInsets.all(spacing()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title.isNotEmpty)
                            Text(
                              title,
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          Text(
                            names,
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: spacing()),
                child: Icon(
                  Icons.play_circle_fill_outlined,
                  size: spacing(5),
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
