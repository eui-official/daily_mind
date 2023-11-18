import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollectionItem extends HookConsumerWidget {
  final Playlist playlist;

  const MixCollectionItem({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgronudHandler = ref.watch(baseBackgroundHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    final items = playlist.items ?? [];
    final firstItem = items.first;
    final firstAudioOffline = firstItem.id.onGetOfflineAudio;

    return BaseCard(
      height: spacing(12),
      content: BaseSpacingContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(playlist.title ?? emptyString),
          ],
        ),
      ),
      image: AssetImage(firstAudioOffline.image),
    );
  }
}
