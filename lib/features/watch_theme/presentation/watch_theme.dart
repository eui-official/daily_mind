import 'package:daily_mind/features/watch_theme/presentation/watch_theme_provider.dart';
import 'package:daily_mind/types/commom.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchTheme extends HookConsumerWidget {
  final OnWidgetThemeBuilder onWidgetThemeBuilder;

  const WatchTheme({
    super.key,
    required this.onWidgetThemeBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(watchThemeProvider);

    return onWidgetThemeBuilder(theme);
  }
}
