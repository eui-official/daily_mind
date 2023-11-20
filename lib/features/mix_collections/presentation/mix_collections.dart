import 'package:daily_mind/features/mix_collection_item/presentation/mix_collection_item.dart';
import 'package:daily_mind/features/mix_collections/presentation/mix_conllections_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollections extends HookConsumerWidget {
  final VoidCallback onCreateNew;

  const MixCollections({
    super.key,
    required this.onCreateNew,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixCollectionsState = ref.watch(mixCollectionsNotifierProvider);

    return StaggeredGrid.count(
      crossAxisCount: 1,
      mainAxisSpacing: spacing(2),
      children: mixCollectionsState.map((playlist) {
        return StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 0.3,
          child: MixCollectionItem(playlist: playlist),
        );
      }).toList(),
    );
  }
}
