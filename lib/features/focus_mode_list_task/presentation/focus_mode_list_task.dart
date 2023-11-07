import 'package:daily_mind/features/focus_mode_list/presentation/focus_mode_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeListTask extends HookConsumerWidget {
  const FocusModeListTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusModeListState = ref.watch(focusModeListNotifierProvider);

    return Container();
  }
}
