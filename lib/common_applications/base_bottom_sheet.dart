import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T?> onShowBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showMaterialModalBottomSheet<T>(
    context: context,
    elevation: 0,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    duration: shorterDuration,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    bounce: true,
    builder: (BuildContext context) {
      return child;
    },
  );
}
