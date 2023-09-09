import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/list_mix/presentation/list_mix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNavigationBarState = ref.watch(appNavigationBarProvider);

    final body = useMemoized(() {
      if (appNavigationBarState.index == 0) {
        return const ListMix();
      }

      return const SizedBox.shrink();
    }, [appNavigationBarState.index]);

    return Scaffold(
      body: body,
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
