import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_tabbar.dart';
import 'package:daily_mind/common_widgets/base_tabbar_item.dart';
import 'package:daily_mind/features/mix_tabbar/presentation/mix_tabbar_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixTabbar extends HookConsumerWidget implements PreferredSizeWidget {
  const MixTabbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);

    final mixTabbarState = ref.watch(mixTabbarNotifierProvider);
    final mixTabbarNotifier = ref.read(mixTabbarNotifierProvider.notifier);

    useEffectDelayed(() {
      tabController.animateTo(mixTabbarState);
    }, [mixTabbarState]);

    return Row(
      children: [
        BaseTabbar(
          tabController: tabController,
          onTap: mixTabbarNotifier.onTap,
          tabs: [
            BaseTabbarItem(title: 'Pha trộn'.tr()),
            BaseTabbarItem(title: 'Bộ sưu tập'.tr()),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
