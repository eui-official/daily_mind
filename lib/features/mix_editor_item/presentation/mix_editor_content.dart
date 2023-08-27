import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class MixEditorContent extends StatelessWidget {
  final String name;

  const MixEditorContent({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: context.textTheme.titleMedium,
    );
  }
}
