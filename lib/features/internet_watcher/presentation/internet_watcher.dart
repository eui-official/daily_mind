import 'package:daily_mind/common_widgets/base_internet_check/presentation/base_internet_check_provider.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/internet_watcher/presentation/internet_watcher_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InternetWatcher extends HookConsumerWidget {
  final Widget child;

  const InternetWatcher({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseInternetCheckState = ref.watch(baseInternetCheckNotifierProvider);

    return BaseNullBuilder(
      value: baseInternetCheckState.value,
      builder: (state) {
        return Stack(
          key: ValueKey(state.connectivityResult),
          children: [
            child,
            AnimatedSwitcher(
              duration: kThemeChangeDuration,
              child: state.isDisconnected
                  ? const InternetWatcherContent()
                  : emptyWidget,
            ),
          ],
        );
      },
    );
  }
}
