import 'package:daily_mind/features/online_auto_play_next_switch/presentation/online_auto_play_next_switch_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineAutoPlayNextSwitch extends HookConsumerWidget {
  const OnlineAutoPlayNextSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineAutoPlayNextSwitchState =
        ref.watch(onlineAutoPlayNextSwitchProvider);
    final onlineAutoPlayNextSwitchNotifier =
        ref.watch(onlineAutoPlayNextSwitchProvider.notifier);

    return Switch(
      value: onlineAutoPlayNextSwitchState,
      onChanged: onlineAutoPlayNextSwitchNotifier.onChanged,
    );
  }
}
