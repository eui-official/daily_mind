import 'package:daily_mind/common_applications/base_snackbar.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/disk_player/presentation/disk_player.dart';
import 'package:daily_mind/features/online_playlist_switcher/presentation/online_playlist_switcher.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerDetails extends HookConsumerWidget {
  final dynamic tag;
  final ImageProvider image;
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
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final playbackStateMemoized = useMemoized(
      () => baseBackgroundHandler.playbackState,
      [],
    );

    final playBackState = useStream(playbackStateMemoized);

    final isPlaying = playBackState.data?.playing ?? false;

    final onViewPlaylist = useCallback(
      () {},
      [],
    );

    final onAddedToPlaylist = useCallback(
      (int playlistId) {
        db.onAddAudioToPlaylist(tag.id, playlistId);

        final onlinePlaylist = db.onGetOnlinePlaylist(playlistId);

        context.pop();

        onShowSnackbar(
          context,
          duration: actionDuration,
          content: 'Đã thêm vào playlist ${onlinePlaylist?.title}',
          action: SnackBarAction(
            label: 'Xem playlist',
            onPressed: onViewPlaylist,
          ),
        );
      },
      [tag],
    );

    return Scaffold(
      body: StackBackground(
        image: image,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: DiskPlayer(
                      image: image,
                      isPlaying: isPlaying,
                    ),
                    expandedHeight: context.height / 2,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: kToolbarHeight),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
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
        ),
      ),
    );
  }
}
