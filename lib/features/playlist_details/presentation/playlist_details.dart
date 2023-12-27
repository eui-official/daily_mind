import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_audios_ids_builder/presentation/base_audio_ids_builder.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaylistDetails extends HookConsumerWidget {
  final int playlistId;

  const PlaylistDetails({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlaylist = db.onGetOnlinePlaylist(playlistId);
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    return BaseNullBuilder(
      value: onlinePlaylist,
      builder: (safeOnlinePlaylist) {
        return BaseAudioIdsBuilder(
          ids: safeOnlinePlaylist.itemIds,
          builder: (audios) {
            return Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await baseBackgroundHandler.onInitOnline(audios);

                  baseMiniPlayerNotifier.onUpdateState(
                    const MiniPlayerState(
                      isShow: true,
                      audioType: AudioTypes.online,
                    ),
                  );
                },
                child: const Icon(Icons.play_arrow),
              ),
              body: PlaylistDetailsContent(
                title: safeOnlinePlaylist.title ?? kEmptyString,
                audios: audios,
              ),
            );
          },
        );
      },
    );
  }
}
