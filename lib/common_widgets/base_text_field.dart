import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value);
      },
      decoration: const InputDecoration(
        hintText: 'Tên của danh sách',
      ),
    );
  }
}
