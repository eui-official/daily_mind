import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/bird_loading/presentation/bird_loading.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_switcher.dart';
import 'package:daily_mind/features/mix/presentation/mix.dart';
import 'package:daily_mind/features/online_list/presentation/online_list.dart';
import 'package:daily_mind/features/settings/pesentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configProvider);
    final appNavigationBarState = ref.watch(appNavigationBarProvider);

    final child = useMemoized(() {
      if (configState.isLoading) {
        return const BirdLoading();
      }

      return Stack(
        children: [
          PersistentTabView(
            navBarOverlap: const NavBarOverlap.none(),
            tabs: [
              PersistentTabConfig(
                screen: const Mix(),
                item: ItemConfig(
                  icon: const Icon(Icons.home),
                  activeColorPrimary: context.theme.primaryColor,
                ),
              ),
              PersistentTabConfig(
                screen: const OnlineList(),
                item: ItemConfig(
                  icon: const Icon(Icons.explore),
                  activeColorPrimary: context.theme.primaryColor,
                ),
              ),
              PersistentTabConfig(
                screen: const Settings(),
                item: ItemConfig(
                  icon: const Icon(Icons.settings),
                  activeColorPrimary: context.theme.primaryColor,
                ),
              ),
            ],
            navBarBuilder: (navBarConfig) => Style1BottomNavBar(
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(
                color: context.theme.scaffoldBackgroundColor,
              ),
            ),
          ),
          const Positioned(
            bottom: kBottomNavigationBarHeight * 1.25,
            left: 0,
            right: 0,
            child: BaseMiniPlayerSwitcher(),
          ),
        ],
      );
    }, [
      context.theme.primaryColor,
      appNavigationBarState,
      configState.isLoading,
    ]);

    return BaseAnimatedSwitcher(child: child);
  }
}
