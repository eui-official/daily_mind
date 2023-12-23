import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile_trailing_arrow.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/online_playlist_selector/presentation/online_playlist_selector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPlaylist extends HookConsumerWidget {
  const SettingsPlaylist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    final onSelected = useCallback(
      (playlistId) {
        final count = db.onCountSongsFromPlaylist(playlistId);

        if (count > 0) {
          context.pop();

          // Get playlist with playlistId from db
          final playlist = db.onGetOnlinePlaylist(playlistId);

          onSafeValueBuilder(
            playlist,
            (safePlaylist) async {
              // Get audios from supapase
              final audios =
                  await supabaseAPI.onGetAudiosByIds(safePlaylist.itemIds);

              await baseBackgroundHandler.onInitOnline(audios);

              baseMiniPlayerNotifier.onUpdateState(
                const MiniPlayerState(
                  isShow: true,
                  audioType: AudioTypes.online,
                ),
              );
            },
          );
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
