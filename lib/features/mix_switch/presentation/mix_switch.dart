import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/features/mix_collections_switcher/presentation/mix_collections_switcher.dart';
import 'package:daily_mind/features/mix_list_audio/presentation/mix_list_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixSwitch extends HookWidget {
  final int index;
  final VoidCallback onCreateNew;

  const MixSwitch({
    super.key,
    required this.index,
    required this.onCreateNew,
  });

  @override
  Widget build(BuildContext context) {
    final child = useMemoized(
      () {
        if (index == 0) {
          return const MixListAudio();
        }

        return MixCollectionsSwitcher(onCreateNew: onCreateNew);
      },
      [index],
    );

    return BaseSpacingContainerHorizontal(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
        child: BaseAnimatedSwitcher(child: child),
      ),
    );
  }
}
