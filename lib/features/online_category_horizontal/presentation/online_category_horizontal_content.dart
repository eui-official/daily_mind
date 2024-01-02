import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_status_icon.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineCategoryHorizontalContent extends HookConsumerWidget {
  final Category category;

  const OnlineCategoryHorizontalContent({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlayerState = ref.watch(onlinePlayerProvider);

    return Container(
      padding: EdgeInsets.all(spacing(2)),
      child: Row(
        children: space(
          [
            Flexible(
              child: BaseHeaderWithDescription(
                name: category.name,
                description: category.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            BaseContentStatusIcon(
              isPlaying: onlinePlayerState.id == category.id,
            ),
          ],
          width: spacing(2),
        ),
      ),
    );
  }
}
