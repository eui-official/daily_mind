import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_text_field.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_bottom_drag_indicator.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_list_item.dart';
import 'package:daily_mind/features/timer_picker/presentation/timer_picker.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart' hide Trans;

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
        color: context.theme.colorScheme.background.withOpacity(0.9),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: space(
            [
              const Center(child: PlayMixBottomDragIndicator()),
              const TimerPicker(),
              BaseContentHeader(
                title: 'name'.tr(),
                child: BaseTextField(
                  initialValue: initialTitle,
                  onChanged: onChanged,
                ),
              ),
              BaseContentHeader(
                title: 'soundList'.tr(),
                child: PlayMixListItem(
                  items: items,
                  playlistId: playlistId,
                  padding: EdgeInsets.only(top: spacing(2)),
                ),
              ),
            ],
            height: spacing(3),
          ),
        ),
      ),
    );
  }
}
