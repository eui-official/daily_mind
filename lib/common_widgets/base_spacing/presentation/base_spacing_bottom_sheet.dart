import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseSpacingBottomSheet extends StatelessWidget {
  final Alignment? alignment;
  final Widget child;

  const BaseSpacingBottomSheet({
    super.key,
    this.alignment,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      alignment: alignment,
      padding: EdgeInsets.symmetric(
        horizontal: spacing(2),
      ).copyWith(
        top: spacing(2),
        bottom: kBottomNavigationBarHeight,
      ),
      child: child,
    );
  }
}
