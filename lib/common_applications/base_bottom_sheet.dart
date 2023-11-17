import 'package:flutter/material.dart';

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
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    builder: (BuildContext context) {
      return child;
    },
  );
}
