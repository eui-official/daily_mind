import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_audios_ids_builder/presentation/base_audio_ids_builder.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
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

    useEffectDelayed(() {
      db.onStreamOnlinePlaylist(playlistId).listen((onlinePlaylist) {
        onSafeValueBuilder(onlinePlaylist, (safeOnlinePlaylist) {
          if (safeOnlinePlaylist.itemIds.isEmpty) {
            context.pop();
          }
        });
      });
    });

    return BaseNullBuilder(
      value: onlinePlaylist,
      builder: (safeOnlinePlaylist) {
        return BaseAudioIdsBuilder(
          ids: safeOnlinePlaylist.itemIds,
          builder: (audios) {
            return Scaffold(
              body: PlaylistDetailsContent(
                audios: audios,
                playlistId: safeOnlinePlaylist.id,
              ),
            );
          },
        );
      },
    );
  }
}
