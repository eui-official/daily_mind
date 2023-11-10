import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OfflineListAudioMinimalPreview extends StatelessWidget {
  final AudioOffline audio;

  const OfflineListAudioMinimalPreview({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInkWell(
      child: Container(
        width: spacing(5),
        height: spacing(5),
        decoration: BoxDecoration(
          borderRadius: circularRadius(),
          image: DecorationImage(image: AssetImage(audio.image)),
        ),
      ),
    );
  }
}
