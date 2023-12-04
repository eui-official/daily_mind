import 'package:flutter/material.dart';

Future<T?> onShowBottomSheet<T>(
  BuildContext context, {
  bool enableDrag = true,
  bool isDismissible = true,
  bool useSafeArea = true,
  required Widget child,
}) {
  return showModalBottomSheet<T>(
    context: context,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    isScrollControlled: true,
    useSafeArea: useSafeArea,
    builder: (BuildContext context) => child,
  );
}
