import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FocusModeTaskItemWorkingSession extends HookWidget {
  final int workingSessions;

  const FocusModeTaskItemWorkingSession({
    super.key,
    required this.workingSessions,
  });

  @override
  Widget build(BuildContext context) {
    final title = useMemoized(() {
      if (workingSessions == 0) {
        return 'Không giới hạn phiên làm việc';
      }

      return '$workingSessions phiên làm việc';
    }, [workingSessions]);

    return Text(
      title,
      style: TextStyle(
        color: secondaryTextColor,
      ),
    );
  }
}
