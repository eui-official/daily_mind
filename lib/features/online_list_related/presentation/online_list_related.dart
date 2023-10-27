import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_list_related_header/presentation/online_list_related_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineListRelated extends HookConsumerWidget {
  const OnlineListRelated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final sequenceStreamMemoized =
        useMemoized(() => baseAudioHandler.onlinePlayer.sequenceStream, []);

    final sequenceSnapshot = useStream(sequenceStreamMemoized);

    final sequence = sequenceSnapshot.data ?? [];

    final onTap = useCallback((int index) {
      baseAudioHandler.onlinePlayer.onSeekToIndex(index);
    }, [
      sequence,
    ]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const OnlineListRelatedHeader(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sequence.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: spacing());
          },
          itemBuilder: (context, index) {
            final s = sequence[index];
            final tag = s.tag;

            return OnlineItem(
              onTap: () => onTap(index),
              image: tag.image,
              title: Text(
                tag.name,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ],
    );
  }
}
