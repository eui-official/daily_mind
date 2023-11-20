import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/focus_mode/presentation/focus_mode_provider.dart';
import 'package:daily_mind/features/focus_mode_session/presentation/focus_mode_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeInit extends HookConsumerWidget {
  const FocusModeInit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final focusModeState = ref.watch(focusModeNotifierProvider);

    final taskCurrentSnapshot =
        useStream(baseBackgroundHandler.onStreamTaskCurrent);

    final child = useMemoized(
      () {
        if (taskCurrentSnapshot.hasData) {
          return const FocusModeSession();
        }

        return emptyWidget;
      },
      [taskCurrentSnapshot.hasData],
    );

    useEffectDelayed(() {
      if (!taskCurrentSnapshot.hasData) {
        final firstTask = focusModeState.first;

        baseBackgroundHandler.onTaskInit(firstTask);
      }
    }, [taskCurrentSnapshot.hasData, focusModeState]);

    return BaseAnimatedSwitcher(child: child);
  }
}
