import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  const BaseTextField({
    super.key,
    this.initialValue,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
