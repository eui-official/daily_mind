import 'package:daily_mind/features/online_auto_play_switch/presentation/online_auto_play_switch_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineAutoPlaySwitch extends HookConsumerWidget {
  const OnlineAutoPlaySwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineAutoPlaySwitchState = ref.watch(onlineAutoPlaySwitchProvider);
    final onlineAutoPlaySwitchNotifier =
        ref.watch(onlineAutoPlaySwitchProvider.notifier);

    return Switch(
      value: onlineAutoPlaySwitchState,
      onChanged: onlineAutoPlaySwitchNotifier.onChanged,
    );
  }
}
