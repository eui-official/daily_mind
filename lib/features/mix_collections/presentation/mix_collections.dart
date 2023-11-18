import 'package:daily_mind/features/mix_collection_item/presentation/mix_collection_item.dart';
import 'package:daily_mind/features/mix_collections/presentation/mix_conllections_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollections extends HookConsumerWidget {
  const MixCollections({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixCollectionsState = ref.watch(mixCollectionsNotifierProvider);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: mixCollectionsState.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing(2));
      },
      itemBuilder: (context, index) {
        final playlist = mixCollectionsState[index];

        return MixCollectionItem(playlist: playlist);
      },
    );
  }
}
