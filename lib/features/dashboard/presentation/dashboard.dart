import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_switcher.dart';
import 'package:daily_mind/features/offline_list/presentation/offline_list.dart';
import 'package:daily_mind/features/settings/pesentation/settings.dart';
import 'package:daily_mind/features/stories/presentation/stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNavigationBarState = ref.watch(appNavigationBarProvider);

    final body = useMemoized(() {
      if (appNavigationBarState.index == 0) {
        return const OfflineList();
      } else if (appNavigationBarState.index == 1) {
        return const Stories();
      }

      return const Settings();
    }, [appNavigationBarState.index]);

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedSwitcher(
              duration: kThemeChangeDuration,
              child: body,
            ),
            const MiniPlayerSwitcher(),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
