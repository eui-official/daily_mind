import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/features/mix_collections/presentation/mix_collections.dart';
import 'package:daily_mind/features/mix_list_audio/presentation/mix_list_audio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixSwitch extends HookWidget {
  const MixSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    final child = useMemoized(
      () {
        if (currentIndex.value == 0) {
          return const MixListAudio();
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
              return DefaultTabController(
                length: 2,
                child: TabBar(
                  dividerColor: Colors.white10,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  onTap: (index) => currentIndex.value = index,
                  tabs: [
                    Tab(text: 'Pha trộn'.tr()),
                    Tab(text: 'Bộ sưu tập'.tr()),
                  ],
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
            child: BaseAnimatedSwitcher(child: child),
          ),
        ],
      ),
    );
  }
}
