import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/item_dismissible/presentation/dismissible.dart';
import 'package:daily_mind/features/mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/offline_list_chord_item/presentation/offline_list_chore_item_provider.dart';
import 'package:daily_mind/features/sound_images_stack/presentation/sound_images_stack.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListChordItem extends HookConsumerWidget {
  final Playlist playlist;

  const OfflineListChordItem({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = playlist.items ?? [];
    final names =
        items.map((item) => item.id.soundOfflineItem.name.tr()).join(', ');
    final title = playlist.title ?? emptyString;
    final offlineListChoreItemNotifier =
        ref.read(offlineListChoreItemProvider.notifier);
    final miniPlayerNotifier = ref.read(miniPlayerProvider.notifier);

    final onPlayChord = useCallback(
      () {
        offlineListChoreItemNotifier.onPlayChore(items);

        miniPlayerNotifier.onUpdateState(
          MiniPlayerState(
            isShow: true,
            image: SoundImagesStack(
              items: items,
              size: 6,
            ),
            title: title.isEmpty ? appDescription : title,
            networkType: NetworkType.offline,
            onPressed: () {},
          ),
        );
      },
      [title, items],
    );

    return InkWell(
      onTap: onPlayChord,
      borderRadius: BorderRadius.circular(spacing(2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacing(2)),
        child: ItemDismissible(
          key: key,
          dismissible: DismissiblePane(onDismissed: () {
            db.deletePlaylist(playlist.id);
          }),
          endActionPaneChildren: [
            SlidableAction(
              onPressed: (context) {
                db.deletePlaylist(playlist.id);
              },
              backgroundColor: context.theme.colorScheme.error,
              label: 'delete'.tr(),
            ),
          ],
          child: Container(
            color: context.theme.primaryColor.withOpacity(0.1),
            child: Row(
              children: [
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SoundImagesStack(
                        items: items,
                        radiusSize: 0,
                      ),
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
                              style: context.textTheme.bodyMedium?.copyWith(
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
      ),
    );
  }
}
