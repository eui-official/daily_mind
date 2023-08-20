import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_add_button.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'new_mix_create_button.dart';

class NewMixButtonSwitcher extends HookConsumerWidget {
  const NewMixButtonSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    final child = newMixSelectedState.isCanAdd
        ? const NewMixAddButton()
        : const NewMixCreateButton();

    return AnimatedSwitcherFlip.flipX(
      duration: defaultDuration,
      child: child,
    );
  }
}
