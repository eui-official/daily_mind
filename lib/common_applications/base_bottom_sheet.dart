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
    barrierColor: context.theme.colorScheme.background.withOpacity(0.75),
    context: context,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    builder: (BuildContext context) {
      return child;
    },
  );
}
