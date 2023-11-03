import 'package:advanced_in_app_review/advanced_in_app_review.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_with_play_icon.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/features/offline_list_chord_item/presentation/offline_list_chore_item_provider.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListChordItem extends HookConsumerWidget {
  final Playlist playlist;

  const OfflineListChordItem({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive(wantKeepAlive: true);

    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);
    final offlineListChoreItemNotifier =
        ref.read(offlineListChoreItemProvider.notifier);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    final mediaItemMemoized = useMemoized(() => baseAudioHandler.mediaItem, []);
    final mediaItemSnapshot = useStream(mediaItemMemoized);

    final items = playlist.items ?? [];
    final names =
        items.map((item) => item.id.soundOfflineItem.name.tr()).join(', ');
    final title = playlist.title ?? emptyString;
    final item = items.first;
    final soundItem = item.id.soundOfflineItem;
    final isPlaying = mediaItemSnapshot.data?.id == playlist.id.toString();

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

        AdvancedInAppReview()
          ..setMinDaysBeforeRemind(7)
          ..setMinDaysAfterInstall(2)
          ..setMinLaunchTimes(2)
          ..setMinSecondsBeforeShowDialog(4)
          ..monitor();
      },
      [
        playlist,
        onOpenOfflinePlayer,
      ],
    );

    return Dismissible(
      key: ValueKey(soundItem.id),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        offlineListChoreItemNotifier.onDispose();

        db.onDeletePlaylist(playlist.id);
      },
      child: BaseCard(
        onTap: onPlayChord,
        image: AssetImage(soundItem.image),
        content: BaseContentWithPlayIcon(
          isPlaying: isPlaying,
          child: Flexible(
            child: BaseHeaderWithDescription(
              name: title,
              description: names,
            ),
          ),
        ),
      ),
    );
  }
}
