import 'package:collection/collection.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

List<Widget> space(
  Iterable<Widget> children, {
  double? height,
  double? width,
}) {
  return children
      .whereNotNull()
      .expand((item) sync* {
        yield SizedBox(
          height: height,
          width: width,
        );

        yield item;
      })
      .skip(1)
      .toList();
}

LinearGradient onGetBaseLinearGradient(BuildContext context) => LinearGradient(
      colors: [
        context.theme.colorScheme.background.withOpacity(.6),
        context.theme.colorScheme.background.withOpacity(.3),
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    );

BorderRadius circularRadius([double size = 1]) =>
    BorderRadius.circular(spacing(size));
