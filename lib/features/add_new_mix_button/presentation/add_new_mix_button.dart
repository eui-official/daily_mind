import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddNewMixButton extends HookConsumerWidget {
  const AddNewMixButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandlerNotifier =
        ref.read(baseAudioHandlerProvider.notifier);

    final onOpenCreateNewMix = useCallback(
      () {
        baseAudioHandlerNotifier.audioHandler.pause();

        context.push('/new-mix').then((value) {
          baseAudioHandlerNotifier.audioHandler.play();
        });
      },
      [],
    );

    return ElevatedButton.icon(
      key: addNewMixKey,
      onPressed: onOpenCreateNewMix,
      icon: const Icon(Icons.playlist_add),
      label: Text('createNewMix'.tr()),
    );
  }
}
