import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_slider_theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModePomodoroWorkingSessions extends StatelessWidget {
  const FocusModePomodoroWorkingSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContentHeader(
      spacingSize: 2,
      title: 'Phiên làm việc',
      child: BaseSliderTheme(
        slider: ReactiveSlider(
          formControlName: 'workingSessions',
          labelBuilder: (sesions) => sesions.toInt().toString(),
          divisions: 10,
          min: 1,
          max: 10,
        ),
      ),
    );
  }
}
