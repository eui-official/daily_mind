import 'package:daily_mind/common_widgets/base_audios_ids_builder/presentation/base_audio_ids_provider.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseAudioIdsBuilder extends HookConsumerWidget {
  final List<String> ids;
  final OnAudiosBuilder builder;

  const BaseAudioIdsBuilder({
    super.key,
    required this.ids,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioIdsState = ref.watch(baseAudioIdsNotifierProvider(ids));

    return builder(baseAudioIdsState.audios);
  }
}
