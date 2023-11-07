import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixAddButton extends HookConsumerWidget {
  const NewMixAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(newMixProvider);

    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final audio = newMixSelectedNotifier.onGetAudio();

    String name = audio?.name ?? emptyString;

    return ElevatedButton(
      onPressed: newMixSelectedNotifier.onAddCurrentId,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(48),
      ),
      child: Text(
        'addToList'.tr(
          namedArgs: {
            "name": name.tr(),
          },
        ),
      ),
    );
  }
}
