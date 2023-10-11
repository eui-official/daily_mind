import 'package:blur/blur.dart';
import 'package:daily_mind/common_providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseBackground extends HookConsumerWidget {
  const BaseBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(appState.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    ).blurred(
      blurColor: context.theme.colorScheme.background,
      colorOpacity: 0.8,
    );
  }
}
