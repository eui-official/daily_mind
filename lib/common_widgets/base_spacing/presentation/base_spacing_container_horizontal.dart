import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseSpacingContainerHorizontal extends StatelessWidget {
  final Alignment? alignment;
  final Widget child;

  const BaseSpacingContainerHorizontal({
    super.key,
    this.alignment,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: child,
    );
  }
}
