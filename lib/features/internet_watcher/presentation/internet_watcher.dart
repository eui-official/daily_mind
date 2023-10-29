import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_internet_check/presentation/base_internet_check_provider.dart';
import 'package:daily_mind/features/internet_watcher/presentation/internet_watcher_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InternetWatcher extends HookConsumerWidget {
  final Widget child;

  const InternetWatcher({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = useState(false);
    final baseInternetCheckState = ref.watch(baseInternetCheckNotifierProvider);

    final onShowInternetDisconnected = useCallback(
      () {
        safeValueBuilder(
          baseInternetCheckState.value,
          (state) async {
            if (state.isDisconnected) {
              isOpen.value = true;

              await showModalBottomSheet(
                context: context,
                backgroundColor: context.theme.colorScheme.background,
                elevation: 0,
                builder: (context) {
                  return const InternetWatcherContent();
                },
              );

              isOpen.value = false;
            } else {
              if (isOpen.value) {
                context.pop();
              }
            }
          },
        );
      },
      [context, baseInternetCheckState],
    );

    useEffectDelayed(() {
      onShowInternetDisconnected();
    }, [onShowInternetDisconnected]);

    return child;
  }
}
