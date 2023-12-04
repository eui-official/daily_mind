import 'package:flutter/material.dart';

Future<T?> onShowScrollableBottomSheet<T>(
  BuildContext context, {
  bool enableDrag = true,
  bool isDismissible = true,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  double initialChildSize = 0.5,
  required ScrollableWidgetBuilder builder,
}) {
  return showModalBottomSheet<T>(
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize,
        builder: builder,
      );
    },
    context: context,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
  );
}
