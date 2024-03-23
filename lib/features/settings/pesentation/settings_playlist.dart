import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile_trailing_arrow.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/online_playlist_selector/presentation/online_playlist_selector.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SettingsPlaylist extends HookConsumerWidget {
  const SettingsPlaylist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSelected = useCallback(
      (
        BuildContext context,
        int playlistId,
      ) {
        final count = db.onCountSongsFromPlaylist(playlistId);

        if (count > 0) {
          pushNewScreen(
            context,
            screen: PlaylistDetails(playlistId: playlistId),
          );
        } else {
          showOkAlertDialog(
            context: context,
            message: 'Playlist không có bài hát nào'.tr(),
          );
        }
      },
      [context],
    );

    return BaseTileTrailingArrow(
      onTap: () {
        pushNewScreen(
          context,
          screen: OnlinePlaylistSelector(
            onSelected: onSelected,
          ),
        );
      },
      title: 'Playlist'.tr(),
    );
  }
}
