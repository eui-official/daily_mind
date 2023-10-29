import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class BaseMarquee extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const BaseMarquee({
    super.key,
    this.style,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: text,
      blankSpace: spacing(3),
      fadingEdgeEndFraction: 0.25,
      fadingEdgeStartFraction: 0.5,
      style: style,
    );
  }
}
