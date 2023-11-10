import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_slider_theme.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModeTaskWorkingSessions extends ReactiveFormField<int, int> {
  FocusModeTaskWorkingSessions({
    super.key,
    required String formControlName,
  }) : super(
          formControlName: formControlName,
          builder: (ReactiveFormFieldState<int, int> field) {
            final workingSessions = field.value ?? 0;

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
                    Text(
                      workingSessions == 0
                          ? 'Không giới hạn'
                          : '$workingSessions phiên',
                    )
                  ],
                  height: spacing(3),
                ),
              ),
            );
          },
        );
}
