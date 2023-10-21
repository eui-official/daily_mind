import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/item_dismissible/presentation/dismissible.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/features/offline_list_chord_item/presentation/offline_list_chore_item_provider.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player.dart';
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
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    final item = items.first;
    final soundItem = item.id.soundOfflineItem;

    final onOpenOfflinePlayer = useCallback(() {
      baseMiniPlayerNotifier.onHide();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (context) {
          return OfflinePlayer(playlistId: playlist.id);
        },
      ).then((value) => baseMiniPlayerNotifier.onShow());
    }, [
      context,
      playlist,
    ]);

    final onPlayChord = useCallback(
      () {
        offlineListChoreItemNotifier.onPlayChore(playlist);

        baseMiniPlayerNotifier.onUpdateState(
          MiniPlayerState(
            isShow: true,
            networkType: NetworkType.offline,
            onTap: onOpenOfflinePlayer,
          ),
        );
      },
      [
        playlist,
        onOpenOfflinePlayer,
      ],
    );

    return ItemDismissible(
      key: key,
      dismissible: DismissiblePane(onDismissed: () {
        db.onDeletePlaylist(playlist.id);
      }),
      endActionPaneChildren: [
        SlidableAction(
          onPressed: (context) {
            db.onDeletePlaylist(playlist.id);
          },
          backgroundColor: context.theme.colorScheme.error,
          label: 'delete'.tr(),
        ),
      ],
      child: BaseCard(
        onTap: onPlayChord,
        imageHeight: imageHeight,
        image: AssetImage(soundItem.image),
        child: Row(
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                  )
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
    );
  }
}
