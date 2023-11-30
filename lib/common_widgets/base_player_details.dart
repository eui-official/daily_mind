import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/features/disk_player/presentation/disk_player.dart';
import 'package:daily_mind/features/online_playlist_switcher/presentation/online_playlist_switcher.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasePlayerDetails extends HookConsumerWidget {
  final ImageProvider image;
  final Widget child;
  final ScrollController? scrollController;

  const BasePlayerDetails({
    super.key,
    required this.image,
    required this.child,
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
            const BasePlayerUserActions(
              actions: [
                OnlinePlaylistSwitcher(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
