import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card_image.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlaylistDetailsImage extends HookWidget {
  final String playlistId;

  const PlaylistDetailsImage({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context) {
    final audioSnapshot = useFuture(supabaseAPI.onGetAudioById(playlistId));
    final audio = audioSnapshot.data;

    return BaseNullBuilder(
      value: audio,
      builder: (safeAudio) {
        return BaseCardImage(
          borderRadius: BorderRadius.zero,
          image: CachedNetworkImageProvider(safeAudio.image),
        );
      },
    );
  }
}
