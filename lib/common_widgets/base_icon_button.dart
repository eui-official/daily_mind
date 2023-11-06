import 'package:daily_mind/common_domains/focus_icon.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseIconButton extends StatelessWidget {
  final bool isSelected;
  final FocusIcon focusIcon;
  final VoidCallback onTap;

  const BaseIconButton({
    super.key,
    required this.focusIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.theme.primaryColorDark
          : context.theme.colorScheme.background,
      borderRadius: circularRadius(5),
      child: InkWell(
        borderRadius: circularRadius(5),
        onTap: onTap,
        child: Container(
          height: spacing(10),
          width: spacing(10),
          alignment: Alignment.center,
          child: ImageIcon(
            AssetImage(focusIcon.icon),
          ),
        ),
      ),
    );
  }
}
