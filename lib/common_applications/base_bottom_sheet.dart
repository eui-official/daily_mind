import 'package:daily_mind/extensions/context.dart';
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
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.background,
            ),
            child: builder(context, scrollController),
          );
        },
      );
    },
    context: context,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    backgroundColor: Colors.transparent,
  );
}
