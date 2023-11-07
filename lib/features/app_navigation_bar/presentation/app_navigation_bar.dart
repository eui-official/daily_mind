import 'package:daily_mind/features/app_navigation_bar/application/app_navigation_bar.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNavigationBarState = ref.watch(appNavigationBarProvider);
    final appNavigationBarNotifier =
        ref.read(appNavigationBarProvider.notifier);

    return BottomNavigationBar(
      items: [
        // onGetBottomNavigationBarItem(
        //   icon: const Icon(LineIcons.clock),
        //   label: 'Tập trung',
        // ),
        onGetBottomNavigationBarItem(
          icon: const Icon(Icons.music_note),
          label: 'Âm thanh tự nhiên',
        ),
        onGetBottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          label: 'Khám phá',
        ),
        onGetBottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: 'Cấu hình',
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: context.theme.hintColor,
      selectedItemColor: context.theme.primaryColor,
      currentIndex: appNavigationBarState.index,
      onTap: appNavigationBarNotifier.onTap,
    );
  }
}
