import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/base_dialogs.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_action.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_image.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_list_audio.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_top_actions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaylistDetailsContent extends HookConsumerWidget {
  final int playlistId;
  final List<Audio> audios;

  const PlaylistDetailsContent({
    super.key,
    required this.audios,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamOnlinePlaylist = useMemoized(
      () => db.onStreamOnlinePlaylist(
        playlistId,
        fireImmediately: true,
      ),
      [playlistId],
    );
    final onlinePlaylistSnapshot = useStream(streamOnlinePlaylist);
    final onlinePlaylist = onlinePlaylistSnapshot.data;
    final title = onlinePlaylist?.title;

    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);
    final onlinePlayerNotifier =
        ref.read(onlinePlayerNotifierProvider.notifier);

    final onPlay = useCallback(([int index = 0]) async {
      onlinePlayerNotifier.onUpdateId(playlistId);
      onlinePlayerNotifier.onUpdateTitle(title);

      await baseBackgroundHandler.onInitOnline(
        audios,
        index: index,
      );

      baseMiniPlayerNotifier.onUpdateState(
        const MiniPlayerState(
          isShow: true,
          audioType: AudioTypes.online,
        ),
      );
    }, [playlistId, title, audios]);

    final onShuffle = useCallback(
      () async {
        final randomIndex = Random().nextInt(audios.length);

        onPlay(randomIndex);
      },
      [audios],
    );

    final onEditTitle = useCallback(
      () async {
        final results = await context.onTextFieldDialog(
          'Tiêu đề playlist'.tr(),
          title,
        );

        if (results.isNotEmpty) {
          final result = results.first;

          onSafeValueBuilder(result, (editedTitle) {
            onSafeValueBuilder(onlinePlaylist, (safeOnlinePlaylist) {
              db.onRenamePlaylist(
                editedTitle,
                safeOnlinePlaylist,
              );
            });
          });
        }
      },
      [title, onlinePlaylist],
    );

    final onDeletePlaylist = useCallback(
      () async {
        final result = await context.onConfirmDeletePlaylistDialog();

        if (result == OkCancelResult.ok) {
          onSafeValueBuilder(
            onlinePlaylist,
            (safeOnlinePlaylist) {
              db.onDeleteOnlinePlaylist(safeOnlinePlaylist.id);
              context.pop();
            },
          );
        }
      },
      [onlinePlaylist],
    );

    final child = useMemoized(
      () {
        if (audios.isEmpty) {
          return kEmptyWidget;
        }

        return Stack(
          children: [
            AppBarScrollview(
              useSafeArea: false,
              title: title ?? kEmptyString,
              actions: [
                PlaylistDetailsAction(
                  onEditTitle: onEditTitle,
                  onDeletePlaylist: onDeletePlaylist,
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: PlaylistDetailsImage(audio: audios.first),
              ),
              expandedHeight: context.height / 3,
              children: [
                PlaylistDetailsTopActions(
                  onPlay: onPlay,
                  onShuffle: onShuffle,
                ),
                BaseNullBuilder(
                  value: onlinePlaylist,
                  builder: (safeOnlinePlaylist) {
                    return PlaylistDetailsListAudio(
                      onlinePlaylist: safeOnlinePlaylist,
                      audios: audios,
                    );
                  },
                )
              ],
            ),
          ],
        );
      },
      [audios, onlinePlaylist],
    );

    return BaseAnimatedSwitcher(child: child);
  }
}
