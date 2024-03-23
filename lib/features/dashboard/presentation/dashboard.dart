import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_position.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/app_loading/presentation/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configNotifierProvider);
    final appNavigationBarState = ref.watch(appNavigationBarNotifierProvider);

    final child = useMemoized(() {
      if (configState.isLoading) {
        return const AppLoading();
      }

      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: context.baseBackgroundLinearGradient,
            ),
          ),
          const AppNavigationBar(),
          const BaseMiniPlayerPosition(),
        ],
      );
    }, [
      context.theme.primaryColor,
      appNavigationBarState,
      configState.isLoading,
    ]);

    return BaseAnimatedSwitcher(child: child);
  }
}
