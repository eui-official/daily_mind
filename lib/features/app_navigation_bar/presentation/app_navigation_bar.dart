import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/features/mix/presentation/mix.dart';
import 'package:daily_mind/features/online_list/presentation/online_list.dart';
import 'package:daily_mind/features/settings/pesentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      screenTransitionAnimation: const ScreenTransitionAnimation(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: context.theme.scaffoldBackgroundColor,
        ),
      ),
      tabs: [
        PersistentTabConfig(
          item: ItemConfig(
            icon: const Icon(Icons.eco_rounded),
            activeForegroundColor: context.theme.primaryColor,
          ),
          screen: const Mix(),
        ),
        PersistentTabConfig(
          item: ItemConfig(
            icon: const Icon(Icons.explore_rounded),
            activeForegroundColor: context.theme.primaryColor,
          ),
          screen: const OnlineList(),
        ),
        PersistentTabConfig(
          item: ItemConfig(
            icon: const Icon(Icons.settings_rounded),
            activeForegroundColor: context.theme.primaryColor,
          ),
          screen: const Settings(),
        ),
      ],
      backgroundColor: context.theme.colorScheme.surface,
      margin: EdgeInsets.zero,
    );
  }
}
