import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNavigationBarState = ref.watch(appNavigationBarProvider);
    final appNavigationBarNotifier =
        ref.read(appNavigationBarProvider.notifier);

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(LineIcons.clock),
          label: 'Tập trung',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Âm thanh tự nhiên',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Khám phá',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Cấu hình',
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: context.theme.hintColor,
      selectedItemColor: context.theme.primaryColor,
      backgroundColor: Colors.transparent,
      currentIndex: appNavigationBarState.index,
      onTap: appNavigationBarNotifier.onTap,
    );
  }
}
