import 'package:daily_mind/common_applications/base_audio_handler/application/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeNewSessionButton extends HookConsumerWidget {
  const FocusModeNewSessionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final onOpenCreateNewSession = useCallback(
      () {
        baseAudioHandler.onHold();

        context.push('/focus-mode/pomodoro/new').then((value) {
          baseAudioHandler.onStopHolding();
        });
      },
      [],
    );

    return ElevatedButton(
      onPressed: onOpenCreateNewSession,
      child: Text('focusCreateNewSession'.tr()),
    );
  }
}
