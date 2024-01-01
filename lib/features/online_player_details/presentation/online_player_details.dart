import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_applications/base_snackbar/base_snackbar.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/disk_player_image/presentation/disk_player_image.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/features/online_player_details/presentation/online_player_details_expand_button.dart';
import 'package:daily_mind/features/online_playlist_selector/presentation/online_playlist_selector.dart';
import 'package:daily_mind/features/online_playlist_switcher/presentation/online_playlist_switcher.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerDetails extends HookConsumerWidget {
  final dynamic tag;
  final ScrollController? scrollController;
  final String image;
  final VoidCallback onExpanded;
  final Widget child;

  const OnlinePlayerDetails({
    super.key,
    required this.image,
    required this.child,
    required this.tag,
    required this.onExpanded,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final onlinePlayerState = ref.watch(onlinePlayerProvider);

    final onAddedToPlaylist = useCallback(
      (
        BuildContext context,
        int playlistId,
      ) {
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

    final onOpenPlaylist = useCallback(() {
      onShowScrollableBottomSheet(
        context,
        useSafeArea: true,
        initialChildSize: 1,
        builder: (context, scrollController) => OnlinePlaylistSelector(
          scrollController: scrollController,
          onSelected: onAddedToPlaylist,
        ),
      );
    }, [tag]);

    final expandedChild = useMemoized(
      () {
        if (onlinePlayerState.isExpanded) {
          return const OnlineListRelated();
        }

        return DiskPlayerImage(image: image);
      },
      [onlinePlayerState, tag],
    );

    final headerChild = useMemoized(() {
      if (onlinePlayerState.isExpanded) {
        return child;
      }

      return kEmptyWidget;
    }, [onlinePlayerState, tag]);

    final aboveChild = useMemoized(() {
      if (onlinePlayerState.isExpanded) {
        return kEmptyWidget;
      }

      return child;
    }, [onlinePlayerState, tag]);

    return Stack(
      children: [
        Positioned.fill(
          child: BaseBackdropFilter(
            image: CachedNetworkImageProvider(image),
          ),
        ),
        BaseSpacingContainer(
          padding: EdgeInsets.symmetric(
            horizontal: spacing(2),
            vertical: kToolbarHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: space(
              [
                BaseAnimatedSwitcher(child: headerChild),
                Expanded(child: BaseAnimatedSwitcher(child: expandedChild)),
                Column(
                  children: space(
                    [
                      BaseAnimatedSwitcher(child: aboveChild),
                      BasePlayerControl(
                        backgroundHandler: baseBackgroundHandler,
                        onNext: baseBackgroundHandler.skipToNext,
                        onPrevious: baseBackgroundHandler.skipToPrevious,
                      ),
                      BasePlayerUserActions(
                        actions: [
                          OnlinePlaylistSwitcher(
                            onOpenPlaylist: onOpenPlaylist,
                          ),
                          OnlinePlayerDetailsExpandButton(
                            onPressed: onExpanded,
                          ),
                        ],
                      ),
                    ],
                    height: spacing(2),
                  ),
                ),
              ],
              height: spacing(3),
            ),
          ),
        )
      ],
    );
  }
}
