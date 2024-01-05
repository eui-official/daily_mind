import 'package:daily_mind/common_widgets/base_music_playing/presentation/base_music_playing.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';

class OnlineItemPlaying extends StatelessWidget {
  const OnlineItemPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: circularRadius(),
        color: context.theme.primaryColorDark.withOpacity(0.5),
      ),
      child: const BaseMusicPlaying(),
    );
  }
}
