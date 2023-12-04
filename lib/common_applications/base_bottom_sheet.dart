import 'package:daily_mind/common_widgets/base_safe_area.dart';
import 'package:flutter/material.dart';

Future<T?> onShowBottomSheet<T>(
  BuildContext context, {
  bool enableDrag = true,
  bool isDismissible = true,
  bool useSafeArea = false,
  required Widget child,
}) {
  return showModalBottomSheet<T>(
    context: context,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    isScrollControlled: true,
    builder: (BuildContext context) {
      if (useSafeArea) {
        return BaseSafeArea(child: child);
      }

      return child;
    },
  );
}
