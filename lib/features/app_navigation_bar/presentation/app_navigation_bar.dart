import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNavigationBarState = ref.read(appNavigationBarProvider);
    final appNavigationBarNotifier =
        ref.read(appNavigationBarProvider.notifier);

    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.music_note,
        Icons.settings,
      ],
      backgroundColor: Colors.transparent,
      activeIndex: appNavigationBarState.index,
      onTap: appNavigationBarNotifier.onTap,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
    );
  }
}
