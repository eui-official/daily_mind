import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_image.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class PlaylistDetails extends StatelessWidget {
  final int playlistId;

  const PlaylistDetails({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context) {
    final onlinePlaylist = db.onGetOnlinePlaylist(playlistId);

    return BaseNullBuilder(
      value: onlinePlaylist,
      builder: (safeOnlinePlaylist) {
        final firstItemId = safeOnlinePlaylist.itemIds.first;

        return AppBarScrollview(
          title: safeOnlinePlaylist.title ?? kEmptyString,
          flexibleSpace: FlexibleSpaceBar(
            background: PlaylistDetailsImage(playlistId: firstItemId),
          ),
          expandedHeight: context.height / 3,
          children: const [],
        );
      },
    );
  }
}
