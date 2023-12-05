import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_sliver_list.dart';
import 'package:daily_mind/common_widgets/base_square_icon.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:daily_mind/features/online_playlist_available/presentation/online_playlist_available_provider.dart';
import 'package:daily_mind/features/online_playlist_available_item/presentation/online_playlist_available_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
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

    return BaseContentHeader(
        title: 'Danh sách playlist'.tr(),
        spacingSize: 2,
        titleStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        child: Expanded(
          child: BaseSliverList(
            scrollController: scrollController,
            children: space(
              [
                Container(
                  padding: EdgeInsets.symmetric(vertical: spacing(2)),
                  child: BaseTile(
                    onTap: openAddOnlinePlaylist,
                    leading: const BaseSquareIcon(iconData: Icons.add),
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
              height: spacing(2),
            ),
          ),
        ));
  }
}
