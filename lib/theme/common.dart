import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

List<Widget> space(
  Iterable<Widget> children, {
  double? height,
  double? width,
}) {
  return children
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

const baseLinearGradient = LinearGradient(
  colors: [
    Colors.black26,
    Colors.black,
  ],
  stops: [0.1, 0.5],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

BorderRadius circularRadius([double size = 1]) =>
    BorderRadius.circular(spacing(size));
