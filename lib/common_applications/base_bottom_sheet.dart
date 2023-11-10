import 'package:flutter/material.dart';

Future<T?> onShowBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  Color backgroundColor = Colors.transparent,
  bool isScrollControlled = false,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet<T>(
    backgroundColor: backgroundColor,
    context: context,
    elevation: 0,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    builder: (BuildContext context) {
      return child;
    },
  );
}
