import 'package:daily_mind/constants/offline_audios.dart';
import 'package:daily_mind/features/mix_audio_category/presentation/mix_audio_category.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixListAudio extends HookWidget {
  final EdgeInsetsGeometry? padding;

  const MixListAudio({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(
      () {
        return kOfflineAudioCategories.map((audioOfflineCategory) {
          final isFirstCategory =
              audioOfflineCategory == kOfflineAudioCategories.first;

          return MixAudioCategory(
            isFirstCategory: isFirstCategory,
            audioOfflineCategory: audioOfflineCategory,
          );
        }).toList();
      },
      [],
    );

    return Column(
      children: space(
        children,
        height: spacing(3),
      ),
    );
  }
}
