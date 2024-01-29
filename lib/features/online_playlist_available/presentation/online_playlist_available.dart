import 'package:daily_mind/common_widgets/base_sliver_list.dart';
import 'package:daily_mind/common_widgets/base_square_container.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:daily_mind/features/online_playlist_available/presentation/online_playlist_available_provider.dart';
import 'package:daily_mind/features/online_playlist_available_item/presentation/online_playlist_available_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlaylistAvailable extends HookConsumerWidget {
  final ValueChanged<int> onSelected;
  final VoidCallback openAddOnlinePlaylist;
  final ScrollController? scrollController;

  const OnlinePlaylistAvailable({
    super.key,
    required this.openAddOnlinePlaylist,
    required this.onSelected,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlaylistsState =
        ref.watch(onlinePlaylistAvailableNotifierProvider);

    return BaseSliverList(
      scrollController: scrollController,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: spacing(2)),
          child: BaseTile(
            onTap: openAddOnlinePlaylist,
            leading: const BaseSquareContainer(child: Icon(Icons.add)),
            title: 'Thêm mới',
          ),
        ),
        ...onlinePlaylistsState.map((onlinePlaylist) {
          return OnlinePlaylistAvailableItem(
            onTap: () => onSelected(onlinePlaylist.id),
            onlinePlaylist: onlinePlaylist,
          );
        })
      ],
    );
  }
}
