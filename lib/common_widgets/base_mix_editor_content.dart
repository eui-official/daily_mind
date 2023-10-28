import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseMixEditorContent extends StatelessWidget {
  final String name;

  const BaseMixEditorContent({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
