import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_applications/base_snackbar/base_snackbar.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/online_playlist_selector/presentation/online_playlist_selector.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseAddToPlaylistBuilder extends HookWidget {
  final Audio audio;
  final OnFunctionHandlerBuilder builder;

  const BaseAddToPlaylistBuilder({
    super.key,
    required this.audio,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final onAddedToPlaylist = useCallback(
      (
        BuildContext context,
        int playlistId,
      ) {
        db.onAddAudioToPlaylist(
          audio.id,
          playlistId,
        );

        final onlinePlaylist = db.onGetOnlinePlaylist(playlistId);

        context.pop();

        onShowSnackbar(
          context,
          message: 'Đã thêm vào playlist ${onlinePlaylist?.title}',
        );
      },
      [audio],
    );

    final onOpenPlaylist = useCallback(() {
      onShowScrollableBottomSheet(
        context,
        useSafeArea: true,
        initialChildSize: 1,
        builder: (context, scrollController) => OnlinePlaylistSelector(
          scrollController: scrollController,
          onSelected: onAddedToPlaylist,
        ),
      );
    }, [audio]);

    return builder(onOpenPlaylist);
  }
}
