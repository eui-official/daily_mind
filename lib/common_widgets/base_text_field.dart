import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final String? hintText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const BaseTextField({
    super.key,
    this.focusNode,
    this.hintText,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing(2),
        ),
      ),
    );
  }
}
