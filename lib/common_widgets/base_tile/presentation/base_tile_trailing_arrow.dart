import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:flutter/material.dart';

class BaseTileTrailingArrow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BaseTileTrailingArrow({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTile(
      title: title,
      onTap: onTap,
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
