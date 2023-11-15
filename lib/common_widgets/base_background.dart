import 'package:daily_mind/common_providers/app_provider.dart';
import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseBackground extends HookConsumerWidget {
  const BaseBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return Background(image: AssetImage(appState.backgroundImage));
  }
}
