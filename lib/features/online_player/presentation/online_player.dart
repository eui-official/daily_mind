import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_widgets/base_player_control.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_adjust_bottom.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayer extends HookConsumerWidget {
  final String image;

  const OnlinePlayer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = CachedNetworkImageProvider(image);

    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (context, scrollController) {
        return BasePlayerControl(
          image: imageProvider,
          scrollController: scrollController,
          child: const OnlinePlayerAdjustBottom(),
        );
      },
    );
  }
}
