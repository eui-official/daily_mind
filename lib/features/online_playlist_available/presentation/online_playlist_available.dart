import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_playlist_available/presentation/online_playlist_available_provider.dart';
import 'package:daily_mind/features/online_playlist_available_item/presentation/online_playlist_available_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlaylistAvailable extends HookConsumerWidget {
  final ValueChanged<int> onSelected;

  const OnlinePlaylistAvailable({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlaylistsState =
        ref.watch(onlinePlaylistAvailableNotifierProvider);

    return BaseContentHeader(
      title: 'Playlist của bạn'.tr(),
      titleStyle: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      child: Flexible(
        child: ListView.builder(
          itemCount: onlinePlaylistsState.length,
          itemBuilder: (context, index) {
            final onlinePlaylist = onlinePlaylistsState[index];

            return OnlinePlaylistAvailableItem(
              onTap: () => onSelected(onlinePlaylist.id),
              title: onlinePlaylist.title ?? emptyString,
            );
          },
        ),
      ),
    );
  }
}
