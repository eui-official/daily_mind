import 'dart:math';

import 'package:blur/blur.dart';
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
        minChildSize: min(0.5, initialChildSize),
        snap: true,
        snapSizes: const [0.5],
        builder: (BuildContext context, ScrollController scrollController) {
          return Stack(
            children: [
              Container(
                color: context.theme.colorScheme.surface.withOpacity(0.4),
              ).frosted(
                frostColor: context.theme.colorScheme.surface.withOpacity(0.4),
              ),
              builder(context, scrollController)
            ],
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
