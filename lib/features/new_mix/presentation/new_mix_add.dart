import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixAdd extends HookConsumerWidget {
  const NewMixAdd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedState = ref.watch(newMixSelectedProvider);
    final soundItem = newMixSelectedState.soundItem;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(48),
      ),
      child: Text('Thêm ${soundItem?.name} vào danh sách'),
    );
  }
}
