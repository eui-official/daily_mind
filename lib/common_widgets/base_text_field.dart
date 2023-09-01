import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const BaseTextField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Tên của danh sách',
      ),
    );
  }
}
