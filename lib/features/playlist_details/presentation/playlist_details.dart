import 'package:daily_mind/common_widgets/base_audios_ids_builder/presentation/base_audio_ids_builder.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/constants/constants.dart';
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

    return BaseNullBuilder(
      value: onlinePlaylist,
      builder: (safeOnlinePlaylist) {
        return BaseAudioIdsBuilder(
          ids: safeOnlinePlaylist.itemIds,
          builder: (audios) {
            return Scaffold(
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
