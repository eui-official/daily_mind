import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlaylistDetailsImage extends HookWidget {
  final Audio audio;

  const PlaylistDetailsImage({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCardImage(
      borderRadius: BorderRadius.zero,
      image: CachedNetworkImageProvider(audio.image),
    );
  }
}
