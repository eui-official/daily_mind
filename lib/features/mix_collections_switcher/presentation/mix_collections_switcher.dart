import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/features/mix_collections/presentation/mix_collections.dart';
import 'package:daily_mind/features/mix_collections/presentation/mix_conllections_provider.dart';
import 'package:daily_mind/features/mix_collections_empty/presentation/mix_collections_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollectionsSwitcher extends HookConsumerWidget {
  final VoidCallback onCreateNew;

  const MixCollectionsSwitcher({
    super.key,
    required this.onCreateNew,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixCollectionsState = ref.watch(mixCollectionsNotifierProvider);

    final child = useMemoized(() {
      if (mixCollectionsState.isEmpty) {
        return MixCollectionsEmpty(onPressed: onCreateNew);
      }

      return const MixCollections();
    }, [mixCollectionsState]);

    return BaseAnimatedSwitcher(child: child);
  }
}
