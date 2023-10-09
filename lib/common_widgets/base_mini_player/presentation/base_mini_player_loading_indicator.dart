import 'package:daily_mind/common_widgets/base_circular_indicator.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseMiniPlayerLoadingIndicator extends StatelessWidget {
  const BaseMiniPlayerLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: spacing(1.5)),
      child: const BaseCircularIndicator(size: 3),
    );
  }
}
