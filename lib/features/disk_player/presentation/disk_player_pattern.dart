import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiskPlayerPattern extends StatelessWidget {
  final Color color;
  final int divideSize;

  const DiskPlayerPattern({
    super.key,
    required this.color,
    required this.divideSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: context.width / divideSize,
      height: context.height / divideSize,
    );
  }
}
