import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseBackdropFilterGradient extends HookWidget {
  final Color? color;

  const BaseBackdropFilterGradient({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = useMemoized(
      () {
        final dominantColor = color;

        if (dominantColor != null) {
          return LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              dominantColor,
              dominantColor,
            ],
          );
        }

        return baseLinearGradient;
      },
      [color],
    );

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: gradient),
        ),
        Container(
          decoration: const BoxDecoration(gradient: baseLinearGradient),
        ),
      ],
    );
  }
}
