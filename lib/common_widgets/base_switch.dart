import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const BaseSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing(4),
      width: spacing(6),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Switch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
