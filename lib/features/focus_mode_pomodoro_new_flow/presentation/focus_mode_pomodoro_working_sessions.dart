import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_slider_theme.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModePomodoroWorkingSessions extends HookWidget {
  final int workingSessions;

  const FocusModePomodoroWorkingSessions({
    super.key,
    required this.workingSessions,
  });

  @override
  Widget build(BuildContext context) {
    final workingSessionsDescription = useMemoized(() {
      if (workingSessions == 0) {
        return 'Không giới hạn';
      }

      return '$workingSessions phiên';
    }, [workingSessions]);

    return BaseContentHeader(
      title: 'Phiên làm việc',
      spacingSize: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: space(
          [
            BaseSliderTheme(
              slider: ReactiveSlider(
                formControlName: 'workingSessions',
                labelBuilder: (sesions) {
                  if (sesions == 0) {
                    return 'Không giới hạn';
                  }

                  return '${sesions.toInt()} phiên';
                },
                divisions: 10,
                min: 0,
                max: 10,
              ),
            ),
            Text(workingSessionsDescription)
          ],
          height: spacing(3),
        ),
      ),
    );
  }
}
