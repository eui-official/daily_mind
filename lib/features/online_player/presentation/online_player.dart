import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_player_details.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayer extends HookConsumerWidget {
  final Category category;

  const OnlinePlayer({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final currentIndexStreamMemoized = useMemoized(
      () => baseBackgroundHandler.onlinePlayer.currentIndexStream,
      [],
    );

    final currentIndexSnapshot = useStream(currentIndexStreamMemoized);

    final currentIndex = currentIndexSnapshot.data ?? 0;

    final sequenceStreamMemoized = useMemoized(
      () => baseBackgroundHandler.onlinePlayer.sequenceStream,
      [],
    );

    final sequenceSnapshot = useStream(sequenceStreamMemoized);

    final sequence = sequenceSnapshot.data ?? [];

    if (sequence.isEmpty) {
      return emptyWidget;
    }

    final s = sequence[currentIndex];
    final tag = s.tag;

    final imageProvider = CachedNetworkImageProvider(tag.image);

    return DraggableScrollableSheet(
      initialChildSize: 1,
      expand: false,
      builder: (context, scrollController) {
        return BasePlayerDetails(
          image: imageProvider,
          scrollController: scrollController,
          child: OnlinePlayerBottom(
            backgroundHandler: baseBackgroundHandler,
            category: category,
            audio: tag,
          ),
        );
      },
    );
  }
}
