import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daily_mind/common_widgets/base_internet_check/presentation/base_internet_check_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseInternetCheck extends HookConsumerWidget {
  final Widget child;

  const BaseInternetCheck({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseInternetCheckNotifier =
        ref.watch(baseInternetCheckNotifierProvider.notifier);

    final onConnectivityChanged = useCallback(
      (ConnectivityResult connectivityResult) {
        baseInternetCheckNotifier.onConnectivityChanged(connectivityResult);
      },
      [],
    );

    useEffect(() {
      Connectivity().onConnectivityChanged.listen(onConnectivityChanged);

      return () {};
    }, []);

    return child;
  }
}
