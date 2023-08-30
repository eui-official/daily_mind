import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_list_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class PlayMixAdjustBottom extends HookWidget {
  final int? playlistId;
  final List<PlaylistItem> items;
  final ScrollController scrollController;

  const PlayMixAdjustBottom({
    super.key,
    required this.items,
    required this.scrollController,
    this.playlistId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing(4)),
        color: Colors.black45,
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Danh sách âm thanh',
              style: context.textTheme.bodyLarge,
            ),
            PlayMixListItem(
              items: items,
              playlistId: playlistId,
            ),
          ],
        ),
      ),
    );
  }
}
