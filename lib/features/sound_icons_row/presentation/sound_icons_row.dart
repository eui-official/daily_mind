import 'package:daily_mind/features/sound_icons_row/presentation/sound_icons_stack.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SoundIconsRow extends HookConsumerWidget {
  final List<String> ids;
  final double iconSize;

  const SoundIconsRow({
    super.key,
    this.iconSize = 3,
    required this.ids,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ids.isEmpty) {
      return const SizedBox.shrink();
    }

    return Material(
      borderRadius: BorderRadius.circular(context.width),
      color: Colors.white12,
      child: InkWell(
        borderRadius: BorderRadius.circular(context.width),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(spacing()),
          child: SoundIconsStack(
            ids: ids,
            iconSize: iconSize,
          ),
        ),
      ),
    );
  }
}
