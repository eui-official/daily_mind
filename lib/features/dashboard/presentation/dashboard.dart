import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/bird_loading/presentation/bird_loading.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_switcher.dart';
import 'package:daily_mind/features/offline_list/presentation/offline_list.dart';
import 'package:daily_mind/features/online_list/presentation/online_list.dart';
import 'package:daily_mind/features/settings/pesentation/settings.dart';
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
    final configState = ref.watch(configProvider);
    final appNavigationBarState = ref.watch(appNavigationBarProvider);

    final children = useMemoized(
        () => [
              const OfflineList(),
              const OnlineList(),
              const Settings(),
            ],
        []);

    final child = useMemoized(() {
      if (configState.isLoading) {
        return const BirdLoading();
      }

      return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IndexedStack(
                index: appNavigationBarState.index,
                children: children,
              ),
              const MiniPlayerSwitcher(),
            ],
          ),
        ),
        bottomNavigationBar: const AppNavigationBar(),
      );
    }, [
      appNavigationBarState,
      configState.isLoading,
    ]);

    return AnimatedSwitcher(
      duration: mediumDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }
}
