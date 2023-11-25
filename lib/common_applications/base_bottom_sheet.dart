import 'package:blur/blur.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

Future<T?> onShowBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet<T>(
    backgroundColor: Colors.transparent,
    context: context,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: Container().blurred(
              blur: spacing(),
              blurColor: context.theme.colorScheme.background,
            ),
          ),
          child,
        ],
      );
    },
  );
}
