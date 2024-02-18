import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/features/alarm/presentation/alarm.dart';
import 'package:daily_mind/features/mix/presentation/mix.dart';
import 'package:daily_mind/features/online_list/presentation/online_list.dart';
import 'package:daily_mind/features/settings/pesentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        Alarm(),
        Mix(),
        OnlineList(),
        Settings(),
      ],
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.spa_rounded),
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: context.theme.primaryColorDark,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.music_note_rounded),
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: context.theme.primaryColorDark,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.explore_rounded),
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: context.theme.primaryColorDark,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings_rounded),
          activeColorPrimary: context.theme.primaryColor,
          inactiveColorPrimary: context.theme.primaryColorDark,
        ),
      ],
      decoration: NavBarDecoration(
        gradient: context.baseBackgroundLinearGradient,
        colorBehindNavBar: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      navBarStyle: NavBarStyle.style2,
      margin: EdgeInsets.zero,
    );
  }
}
