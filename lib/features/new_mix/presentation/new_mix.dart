import 'package:daily_mind/common_providers/app_provider.dart';
import 'package:daily_mind/features/app_bar_filter/presentation/app_bar_filter.dart';
import 'package:daily_mind/features/list_sounds/presentation/favorite_sounds.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_button_switcher.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMix extends HookConsumerWidget {
  const NewMix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);
    final newMixSelectedNotifier = ref.read(newMixSelectedProvider.notifier);
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        flexibleSpace: const AppBarFilter(),
        title: const Text('Âm thanh mới'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          StackBackground(
            image: appState.backgroundImage,
            child: Container(
              padding: EdgeInsets.only(bottom: spacing(10)),
              child: ListSounds(
                selectingId: newMixSelectedState.selectingId,
                selectedIds: newMixSelectedState.selectedIds,
                onSelected: newMixSelectedNotifier.onSelected,
                onDeleted: newMixSelectedNotifier.onDeleted,
              ),
            ),
          ),
          Positioned(
            bottom: spacing(3),
            child: const NewMixButtonSwitcher(),
          ),
        ],
      ),
    );
  }
}
