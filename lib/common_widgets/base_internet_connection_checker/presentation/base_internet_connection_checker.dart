import 'package:daily_mind/common_widgets/base_internet_connection_checker/presentation/base_internet_connection_checker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class BaseInternetConnectionChecker extends HookConsumerWidget {
  final Widget child;

  const BaseInternetConnectionChecker({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseInternetCheckNotifier =
        ref.watch(baseInternetConnectionCheckerNotifierProvider.notifier);

    final onConnectivityChanged = useCallback(
      (bool hasInternetAccess) {
        baseInternetCheckNotifier.onConnectivityChanged(hasInternetAccess);
      },
      [],
    );

    useEffect(() {
      InternetConnection().onStatusChange.listen((status) {
        status == InternetStatus.connected
            ? onConnectivityChanged(true)
            : onConnectivityChanged(false);
      });

      return () {};
    }, []);

    return child;
  }
}
