import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_image.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_list_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart' hide Trans;

class PlaylistDetailsContent extends HookWidget {
  final String title;
  final List<Audio> audios;

  const PlaylistDetailsContent({
    super.key,
    required this.title,
    required this.audios,
  });

  @override
  Widget build(BuildContext context) {
    final child = useMemoized(
      () {
        if (audios.isEmpty) {
          return kEmptyWidget;
        }

        return AppBarScrollview(
          title: title,
          flexibleSpace: FlexibleSpaceBar(
            background: PlaylistDetailsImage(audio: audios.first),
          ),
          expandedHeight: context.height / 3,
          children: [
            PlaylistDetailsListAudio(audios: audios),
          ],
        );
      },
      [audios],
    );

    return BaseAnimatedSwitcher(child: child);
  }
}
