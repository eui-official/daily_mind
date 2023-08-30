import 'package:daily_mind/common_widgets/base_mix_editor_item.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class PlayMixAdjustBottom extends HookWidget {
  final List<PlaylistItem> items;
  final ScrollController scrollController;

  const PlayMixAdjustBottom({
    super.key,
    required this.items,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final onVolumeChanged = useCallback((double value) {}, []);

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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: spacing(2));
              },
              itemBuilder: (context, index) {
                final item = items[index];
                final soundItem = item.id.soundItem;

                return BaseMixEditorItem(
                  name: soundItem.name,
                  image: soundItem.image,
                  initVolume: item.volume,
                  onVolumeChanged: onVolumeChanged,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
