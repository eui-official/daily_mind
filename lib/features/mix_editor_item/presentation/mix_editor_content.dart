import 'package:daily_mind/theme/theme.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: Text(
        name,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
