import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_theme_without_divider.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/bird_loading/presentation/bird_loading.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_switcher.dart';
import 'package:daily_mind/features/focus_mode/presentation/focus_mode.dart';
import 'package:daily_mind/features/mix/presentation/mix.dart';
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
              const FocusMode(),
              const Mix(),
              const OnlineList(),
              const Settings(),
            ],
        []);

    final child = useMemoized(() {
      if (configState.isLoading) {
        return const BirdLoading();
      }

      return BaseThemeWithoutDivider(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: BaseAnimatedSwitcher(
              child: children[appNavigationBarState.index],
            ),
          ),
          persistentFooterButtons: const [BaseMiniPlayerSwitcher()],
          bottomNavigationBar: const AppNavigationBar(),
        ),
      );
    }, [
      appNavigationBarState,
      configState.isLoading,
    ]);

    return BaseAnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }
}
