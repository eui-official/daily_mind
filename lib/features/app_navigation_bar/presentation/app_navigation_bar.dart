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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Âm thanh',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_rounded),
          label: 'Truyện',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Cấu hình',
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: context.theme.primaryColor,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      currentIndex: appNavigationBarState.index,
      onTap: appNavigationBarNotifier.onTap,
    );
  }
}
