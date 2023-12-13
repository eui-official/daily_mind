import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_applications/base_snackbar/base_snackbar.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
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
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

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
          Positioned.fill(
            child: BaseBackdropFilter(
              image: CachedNetworkImageProvider(image),
            ),
          ),
          Column(
            children: [
              BaseSpacingContainer(
                padding: const EdgeInsets.all(kToolbarHeight),
                child: DiskPlayerImage(image: image),
              ),
              Expanded(
                child: SingleChildScrollView(child: child),
              ),
              BaseSpacingContainer(
                child: Column(
                  children: [
                    BasePlayerControl(
                      backgroundHandler: baseBackgroundHandler,
                      onNext: baseBackgroundHandler.skipToNext,
                      onPrevious: baseBackgroundHandler.skipToPrevious,
                    ),
                    BasePlayerUserActions(
                      actions: [
                        OnlinePlaylistSwitcher(onSelected: onAddedToPlaylist),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}