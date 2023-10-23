import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_list_related_header/presentation/online_list_related_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineListRelated extends HookConsumerWidget {
  final List<Item> items;

  const OnlineListRelated({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final onTap = useCallback((int index) {
      baseAudioHandler.onOnlinePlayerPlayFromIndex(index);
    }, [
      items,
    ]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const OnlineListRelatedHeader(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: spacing());
          },
          itemBuilder: (context, index) {
            final item = items[index];

            return OnlineItem(
              onTap: () => onTap(index),
              image: item.image,
              title: Text(
                item.name,
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
