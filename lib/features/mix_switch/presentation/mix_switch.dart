import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/mix_collections/presentation/mix_collections.dart';
import 'package:daily_mind/features/offline_list_audio/presentation/offline_list_audio.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:toggle_switch/toggle_switch.dart';

class MixSwitch extends HookWidget {
  const MixSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    final child = useMemoized(
      () {
        if (currentIndex.value == 0) {
          return const OfflineListAudio();
        }

        return const MixCollections();
      },
      [currentIndex.value],
    );

    return BaseSpacingContainerHorizontal(
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return ToggleSwitch(
                animate: true,
                animationDuration: defaultDuration.inMilliseconds,
                cornerRadius: spacing(2),
                inactiveBgColor:
                    context.theme.primaryColorDark.withOpacity(0.5),
                initialLabelIndex: currentIndex.value,
                labels: ['Pha trộn'.tr(), 'Bộ sưu tập'.tr()],
                minWidth: constraints.maxWidth / 2,
                totalSwitches: 2,
                onToggle: (index) => currentIndex.value = index ?? 0,
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
            child: BaseAnimatedSwitcher(child: child),
          )
        ],
      ),
    );
  }
}
