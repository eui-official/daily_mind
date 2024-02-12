import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_add_to_playlist_builder/presentation/base_add_to_playlist.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/features/online_player_details/presentation/online_player_details_expand_button.dart';
import 'package:daily_mind/features/online_player_disk_image/presentation/online_player_disk_image.dart';
import 'package:daily_mind/features/online_playlist_add/presentation/online_playlist_add.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerDetails extends HookConsumerWidget {
  final dynamic audio;
  final ScrollController? scrollController;
  final VoidCallback onExpanded;
  final Widget child;

  const OnlinePlayerDetails({
    super.key,
    required this.child,
    required this.audio,
    required this.onExpanded,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final onlinePlayerState = ref.watch(onlinePlayerProvider);

    final imageProvider = useMemoized(
      () {
        return CachedNetworkImageProvider(audio.image);
      },
      [audio.image],
    );

    final expandedChild = useMemoized(
      () {
        if (onlinePlayerState.isExpanded) {
          return const OnlineListRelated();
        }

        return OnlinePlayerDiskImage(audio: audio);
      },
      [onlinePlayerState, audio],
    );

    final headerChild = useMemoized(() {
      if (onlinePlayerState.isExpanded) {
        return child;
      }

      return kEmptyWidget;
    }, [onlinePlayerState, audio]);

    final aboveChild = useMemoized(() {
      if (onlinePlayerState.isExpanded) {
        return kEmptyWidget;
      }

      return child;
    }, [onlinePlayerState, audio]);

    return Stack(
      children: [
        Positioned.fill(
          child: BaseBackdropFilter(image: imageProvider),
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
                        audio: audio,
                      ),
                      BasePlayerUserActions(
                        actions: [
                          BaseAddToPlaylistBuilder(
                            audio: audio,
                            builder: (onOpenPlaylist) {
                              return OnlinePlaylistAdd(
                                onOpenPlaylist: onOpenPlaylist,
                              );
                            },
                          ),
                          OnlinePlayerDetailsExpandButton(
                            onPressed: onExpanded,
                          ),
                        ],
                      ),
                    ],
                    height: spacing(3),
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
