import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_player_details.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayer extends HookConsumerWidget {
  final List<Item> fullItems;

  const OnlinePlayer({
    super.key,
    required this.fullItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final currentIndexSnapshot =
        useStream(baseAudioHandler.onlinePlayer.currentIndexStream);
    final currentIndex = currentIndexSnapshot.data ?? 0;
    final item = fullItems[currentIndex];

    final imageProvider = CachedNetworkImageProvider(item.image);

    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (context, scrollController) {
        return BasePlayerDetails(
          image: imageProvider,
          scrollController: scrollController,
          child: OnlinePlayerBottom(
            audioHandler: baseAudioHandler,
            fullItems: fullItems,
            item: item,
          ),
        );
      },
    );
  }
}
