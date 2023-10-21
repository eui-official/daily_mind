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
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final onOpenCreateNewMix = useCallback(
      () {
        baseAudioHandler.pause();

        context.push('/new-mix').then((value) {
          baseAudioHandler.play();
        });
      },
      [],
    );

    return ElevatedButton(
      key: addNewMixKey,
      onPressed: onOpenCreateNewMix,
      child: Text('createNewMix'.tr()),
    );
  }
}
