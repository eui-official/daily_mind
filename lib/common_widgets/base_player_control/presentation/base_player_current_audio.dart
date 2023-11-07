import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class BasePlayerCurrentAudio extends StatelessWidget {
  final Audio audio;

  const BasePlayerCurrentAudio({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: space(
        [
          Text(
            'currentPlaying'.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          OnlineItem(
            image: audio.image,
            title: BaseMarquee(
              text: audio.name,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        height: spacing(2),
      ),
    );
  }
}
