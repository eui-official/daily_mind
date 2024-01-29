import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlaylistDetailsTopActions extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onShuffle;

  const PlaylistDetailsTopActions({
    super.key,
    required this.onPlay,
    required this.onShuffle,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      child: Row(
        children: space(
          [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onPlay,
                icon: const Icon(Icons.play_arrow_rounded),
                label: Text('Phát'.tr()),
              ),
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onShuffle,
                icon: const Icon(Icons.shuffle_rounded),
                label: Text('Phát ngẫu nhiên'.tr()),
              ),
            )
          ],
          width: spacing(2),
        ),
      ),
    );
  }
}
