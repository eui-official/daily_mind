import 'package:flutter/material.dart';

Future<T?> onShowBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  backgroundColor = Colors.transparent,
  isScrollControlled = false,
  isDismissible = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: backgroundColor,
    isScrollControlled: isScrollControlled,
    elevation: 0,
    isDismissible: isDismissible,
    builder: (BuildContext context) {
      return child;
    },
  );
}
