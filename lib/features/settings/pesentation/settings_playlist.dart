import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile_trailing_arrow.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/online_playlist_selector/presentation/online_playlist_selector.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPlaylist extends HookConsumerWidget {
  const SettingsPlaylist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSelected = useCallback(
      (playlistId) {
        final count = db.onCountSongsFromPlaylist(playlistId);

        if (count > 0) {
          context.push(PlaylistDetails(playlistId: playlistId));
        } else {
          showOkAlertDialog(
            context: context,
            message: 'Playlist không có bài hát nào'.tr(),
          );
        }
      },
      [],
    );

    return BaseTileTrailingArrow(
      onTap: () {
        onShowScrollableBottomSheet(
          context,
          initialChildSize: 1,
          builder: (context, scrollController) => OnlinePlaylistSelector(
            scrollController: scrollController,
            onSelected: onSelected,
          ),
        );
      },
      title: 'Playlist'.tr(),
    );
  }
}
