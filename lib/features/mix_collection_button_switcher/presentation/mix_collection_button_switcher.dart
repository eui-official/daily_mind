import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixCollectionButtonSwitcher extends HookWidget {
  final bool isCanAddNewMix;
  final VoidCallback onSaveMix;
  final VoidCallback onDeleteMix;

  const MixCollectionButtonSwitcher({
    super.key,
    required this.isCanAddNewMix,
    required this.onSaveMix,
    required this.onDeleteMix,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = useMemoized(
      () => isCanAddNewMix ? onSaveMix : onDeleteMix,
      [
        isCanAddNewMix,
        onSaveMix,
        onDeleteMix,
      ],
    );

    final backgroundColor = useMemoized(
        () => isCanAddNewMix
            ? context.theme.primaryColorDark
            : context.theme.colorScheme.error,
        [isCanAddNewMix]);

    final iconData = useMemoized(
      () => isCanAddNewMix
          ? Icons.playlist_add_rounded
          : Icons.playlist_remove_rounded,
      [isCanAddNewMix],
    );

    return BaseIconButtonWithTitle(
      onPressed: onPressed,
      iconData: iconData,
      backgroundColor: backgroundColor,
    );
  }
}
