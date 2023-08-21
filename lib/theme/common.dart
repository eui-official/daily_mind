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
      })
      .skip(1)
      .toList();
}
