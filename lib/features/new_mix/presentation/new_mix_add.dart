import 'package:flutter/material.dart';

class NewMixAdd extends StatelessWidget {
  const NewMixAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 48),
      ),
      child: const Text('Thêm vào danh sách'),
    );
  }
}
