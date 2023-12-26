import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_item_box_size.dart';
import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart' hide Trans;

class BasePlayerCurrentAudio extends HookWidget {
  final Audio audio;
  final bool isComplex;

  const BasePlayerCurrentAudio({
    super.key,
    required this.audio,
    this.isComplex = true,
  });

  @override
  Widget build(BuildContext context) {
    final audioTitle = useMemoized(() {
      final marquee = BaseMarquee(
        text: audio.name,
        style: context.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      );

      if (isComplex) {
        return OnlineItem(
          image: audio.image,
          title: marquee,
        );
      }

      return BaseItemBoxSize(child: marquee);
    }, [isComplex, audio]);

    return BaseAnimatedSwitcher(child: audioTitle);
  }
}
