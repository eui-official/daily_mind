import 'package:daily_mind/features/setting_watcher/presentation/setting_watcher_provider.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingWatcher extends HookConsumerWidget {
  final String type;
  final OnWidgetSettingBuilder onWidgetSettingBuilder;

  const SettingWatcher({
    super.key,
    required this.onWidgetSettingBuilder,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingWatcherProvider(type));

    return onWidgetSettingBuilder(setting);
  }
}
