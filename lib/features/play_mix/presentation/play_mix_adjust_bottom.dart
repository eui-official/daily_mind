import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_text_field.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_list_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class PlayMixAdjustBottom extends HookWidget {
  final int playlistId;
  final List<PlaylistItem> items;
  final ScrollController scrollController;
  final ValueChanged<String>? onChanged;
  final String? initialTitle;

  const PlayMixAdjustBottom({
    super.key,
    required this.items,
    required this.scrollController,
    required this.playlistId,
    this.initialTitle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background.withOpacity(0.6),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: space(
            [
              BaseContentHeader(
                title: 'Tên playlist',
                child: BaseTextField(
                  initialValue: initialTitle,
                  onChanged: onChanged,
                ),
              ),
              BaseContentHeader(
                title: 'Danh sách âm thanh',
                child: PlayMixListItem(
                  items: items,
                  playlistId: playlistId,
                  padding: EdgeInsets.only(top: spacing(3)),
                ),
              ),
            ],
            height: spacing(4),
          ),
        ),
      ),
    );
  }
}
