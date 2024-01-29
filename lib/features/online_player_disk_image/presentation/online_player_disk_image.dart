import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/disk_player_image/presentation/disk_player_image.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlayerDiskImage extends HookWidget {
  final Audio audio;

  const OnlinePlayerDiskImage({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    final description = useMemoized(() {
      return audio.description ?? kEmptyString;
    }, [audio]);

    return Column(
      children: space(
        [
          DiskPlayerImage(image: audio.image),
          if (description.isNotEmpty)
            Text(
              description,
              textAlign: TextAlign.justify,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.theme.hintColor,
              ),
            )
        ],
        height: spacing(2),
      ),
    );
  }
}