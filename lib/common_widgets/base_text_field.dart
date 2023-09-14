import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const BaseTextField({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: 'nameOfTheMix'.tr(),
      ),
    );
  }
}
