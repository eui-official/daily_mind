import 'package:flutter/material.dart';

class FocusModeTaskItemWorkingSession extends StatelessWidget {
  final int workingSessions;

  const FocusModeTaskItemWorkingSession({
    super.key,
    required this.workingSessions,
  });

  @override
  Widget build(BuildContext context) {
    if (workingSessions == 0) {
      return const Text('Không giới hạn phiên làm việc');
    }

    return Text('$workingSessions phiên làm việc');
  }
}
