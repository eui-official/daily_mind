import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_icon_button.dart';
import 'package:daily_mind/constants/focus_icons.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModeTaskIcon extends ReactiveFormField<String, String> {
  FocusModeTaskIcon({
    super.key,
    required String formControlName,
  }) : super(
          formControlName: formControlName,
          builder: (ReactiveFormFieldState<String, String> field) {
            final selectedId = field.value ?? 'cleaning';

            return BaseContentHeader(
              title: 'Ảnh đại diện',
              spacingSize: 3,
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: spacing(2),
                crossAxisSpacing: spacing(2),
                children: focusIcons.map((focusIcon) {
                  final isSelected = focusIcon.id == selectedId;

                  return AspectRatio(
                    aspectRatio: 1,
                    child: BaseIconButton(
                      focusIcon: focusIcon,
                      isSelected: isSelected,
                      onTap: () => field.didChange(focusIcon.id),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        );
}
