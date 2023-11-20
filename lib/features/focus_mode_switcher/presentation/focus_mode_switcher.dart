import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/features/focus_mode/presentation/focus_mode_provider.dart';
import 'package:daily_mind/features/focus_mode_empty_list/presentation/focus_mode_empty.dart';
import 'package:daily_mind/features/focus_mode_init/presentation/focus_mode_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeSwitcher extends HookConsumerWidget {
  const FocusModeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusModeState = ref.watch(focusModeNotifierProvider);

    final child = useMemoized(() {
      if (focusModeState.isEmpty) {
        return const FocusModeEmptyList();
      }

      return const FocusModeInit();
    }, [focusModeState]);

    return Scaffold(
      body: Stack(
        children: [
          const BaseBackground(),
          SafeArea(
            child: BaseAnimatedSwitcher(child: child),
          )
        ],
      ),
    );
  }
}
