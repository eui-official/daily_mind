import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/app_bar_filter/presentation/app_bar_filter.dart';
import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:daily_mind/features/list_sounds/presentation/favorite_sounds.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_add.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_create_button.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMix extends HookConsumerWidget {
  const NewMix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const Background(backgroundIndex: 1),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: spacing(4),
                bottom: spacing(8),
              ),
              child: SafeArea(
                child: ListSounds(
                  selectingId: newMixSelectedState.selectingId,
                  onSelected: newMixSelectedNotifier.onSelected,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: spacing(3),
            child: AnimatedSwitcherFlip.flipX(
              duration: defaultDuration,
              child: newMixSelectedState.isSelecting
                  ? const NewMixAdd()
                  : const NewMixCreateButton(),
            ),
          ),
        ],
      ),
    );
  }
}
