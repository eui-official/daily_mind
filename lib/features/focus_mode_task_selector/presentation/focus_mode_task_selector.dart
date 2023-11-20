import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class FocusModeTaskSelector extends HookWidget {
  final String title;

  const FocusModeTaskSelector({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final onShowListTask = useCallback(() {}, []);

    return ElevatedButton(
      onPressed: onShowListTask,
      child: Container(
        padding: EdgeInsets.all(spacing()),
        child: Text(
          title,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
