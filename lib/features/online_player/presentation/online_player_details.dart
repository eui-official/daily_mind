import 'package:daily_mind/common_applications/base_snackbar/base_snackbar.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/disk_player_image/presentation/disk_player_image.dart';
import 'package:daily_mind/features/online_playlist_switcher/presentation/online_playlist_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerDetails extends HookConsumerWidget {
  final dynamic tag;
  final String image;
  final ScrollController? scrollController;
  final Widget child;

  const OnlinePlayerDetails({
    super.key,
    required this.image,
    required this.child,
    required this.tag,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddedToPlaylist = useCallback(
      (int playlistId) {
        db.onAddAudioToPlaylist(tag.id, playlistId);

        final onlinePlaylist = db.onGetOnlinePlaylist(playlistId);

        context.pop();

        onShowSnackbar(
          context,
          message: 'Đã thêm vào playlist ${onlinePlaylist?.title}',
        );
      },
      [tag],
    );

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: kToolbarHeight),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            DiskPlayerImage(image: image),
                            child,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BasePlayerUserActions(
                actions: [
                  OnlinePlaylistSwitcher(onSelected: onAddedToPlaylist),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
