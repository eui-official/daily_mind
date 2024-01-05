import 'package:daily_mind/common_widgets/base_music_playing/presentation/base_music_playing.dart';
import 'package:daily_mind/common_widgets/base_sliable.dart';
import 'package:daily_mind/common_widgets/base_square_container.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlaylistAvailableItem extends HookConsumerWidget {
  final VoidCallback onTap;
  final OnlinePlaylist onlinePlaylist;

  const OnlinePlaylistAvailableItem({
    super.key,
    required this.onlinePlaylist,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlayerState = ref.watch(onlinePlayerProvider);

    final leading = useMemoized(() {
      final isSelected = onlinePlayerState.id == onlinePlaylist.id;
      final child =
          isSelected ? const BaseMusicPlaying() : const Icon(Icons.music_note);

      return BaseSquareContainer(child: child);
    }, [
      onlinePlaylist,
      onlinePlayerState,
    ]);

    return BaseSliable(
      id: onlinePlaylist.id,
      onDeleted: () => db.onDeleteOnlinePlaylist(onlinePlaylist.id),
      child: BaseTile(
        onTap: onTap,
        leading: leading,
        title: onlinePlaylist.title ?? kEmptyString,
        subtitle: Text(
          '${onlinePlaylist.itemIds.length} bài hát',
          style: const TextStyle(color: secondaryTextColor),
        ),
      ),
    );
  }
}
