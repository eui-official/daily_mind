import 'package:daily_mind/features/mix/presentation/mix.dart';
import 'package:daily_mind/features/online_list/presentation/online_list.dart';
import 'package:daily_mind/features/settings/pesentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarOverlap: const NavBarOverlap.none(),
      tabs: [
        PersistentTabConfig(
          screen: const Mix(),
          item: ItemConfig(
            icon: const Icon(Icons.music_note),
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
    );
  }
}
