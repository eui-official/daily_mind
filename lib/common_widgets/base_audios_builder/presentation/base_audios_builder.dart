import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_widgets/base_audios_builder/presentation/base_audios_builder_provider.dart';
import 'package:daily_mind/common_widgets/base_audios_builder/presentation/base_audios_skeleton.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseAudiosBuilder extends HookConsumerWidget {
  final OnListItemBuilder<AudioCategory> onAudiosBuilder;

  const BaseAudiosBuilder({
    super.key,
    required this.onAudiosBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudiosBuilderState = ref.watch(baseAudiosBuilderNotifierProvider);

    final child = useMemoized(() {
      final audioCategories = baseAudiosBuilderState.value ?? [];

      if (baseAudiosBuilderState.isLoading) {
        return const BaseAudiosSkeleton();
      }

      return onAudiosBuilder(
        context,
        audioCategories,
      );
    }, [baseAudiosBuilderState]);

    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: child,
    );
  }
}
