import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixCreateButton extends HookConsumerWidget {
  const NewMixCreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    return ElevatedButton(
      onPressed: newMixSelectedState.isNoSound ? emptyFunction : () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 48),
      ),
      child: const Text('Bước tiếp theo'),
    );
  }
}
