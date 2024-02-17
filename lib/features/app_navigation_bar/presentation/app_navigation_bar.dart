import 'package:daily_mind/features/alarm/presentation/alarm.dart';
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
      backgroundColor: Colors.transparent,
      navBarOverlap: const NavBarOverlap.none(),
      margin: EdgeInsets.zero,
      tabs: [
        PersistentTabConfig(
          screen: const Alarm(),
          item: ItemConfig(
            icon: const Icon(Icons.spa_rounded),
            activeColorPrimary: context.theme.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: const Mix(),
          item: ItemConfig(
            icon: const Icon(Icons.music_note_rounded),
            activeColorPrimary: context.theme.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: const OnlineList(),
          item: ItemConfig(
            icon: const Icon(Icons.explore_rounded),
            activeColorPrimary: context.theme.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: const Settings(),
          item: ItemConfig(
            icon: const Icon(Icons.settings_rounded),
            activeColorPrimary: context.theme.primaryColor,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: context.theme.colorScheme.background,
        ),
      ),
    );
  }
}
