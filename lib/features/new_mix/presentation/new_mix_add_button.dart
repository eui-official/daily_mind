import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixAddButton extends HookConsumerWidget {
  const NewMixAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedNotifier = ref.read(newMixSelectedProvider.notifier);
    final newMixSelectedState = ref.watch(newMixSelectedProvider);
    final soundItem = newMixSelectedState.soundItem;

    return ElevatedButton(
      onPressed: newMixSelectedNotifier.onAddCurrentId,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(48),
      ),
      child: Text(
        'addToList'.tr(
          namedArgs: {
            "name": soundItem?.name.tr() ?? emptyString,
          },
        ),
      ),
    );
  }
}
