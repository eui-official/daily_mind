import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/focus_mode_empty_list/presentation/focus_mode_empty.dart';
import 'package:daily_mind/features/focus_mode_list/presentation/focus_mode_list.dart';
import 'package:daily_mind/features/focus_mode_list/presentation/focus_mode_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeListSwitcher extends HookConsumerWidget {
  const FocusModeListSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusModeListState = ref.watch(focusModeListNotifierProvider);

    final child = useMemoized(() {
      if (focusModeListState.isEmpty) {
        return const FocusModeEmptyList();
      }

      return const FocusModeList();
    }, [focusModeListState]);

    return AnimatedSwitcher(
      duration: defaultDuration,
      child: child,
    );
  }
}
