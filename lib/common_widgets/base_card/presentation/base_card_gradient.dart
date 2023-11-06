import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';

class BaseCardGradient extends StatelessWidget {
  final Color color;

  const BaseCardGradient({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: circularRadius(2),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.9),
              color.withOpacity(0.3),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
