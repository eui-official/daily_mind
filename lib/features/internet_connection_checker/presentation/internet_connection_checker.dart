import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_internet_connection_checker/presentation/base_internet_connection_checker_provider.dart';
import 'package:daily_mind/features/internet_connection_checker/presentation/internet_connection_notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InternetConnectionChecker extends HookConsumerWidget {
  final Widget child;

  const InternetConnectionChecker({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = useState(false);
    final baseInternetCheckState =
        ref.watch(baseInternetConnectionCheckerNotifierProvider);

    final onShowInternetDisconnected = useCallback(
      () {
        onSafeValueBuilder(
          baseInternetCheckState.value,
          (state) async {
            if (state.isDisconnected) {
              isOpen.value = true;

              await onShowBottomSheet(
                context,
                backgroundColor: context.theme.colorScheme.background,
                child: const InternetConnectionNotice(),
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
