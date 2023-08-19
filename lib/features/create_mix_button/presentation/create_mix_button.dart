import 'package:flutter/material.dart';

class CreateMixButton extends StatelessWidget {
  const CreateMixButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 48),
      ),
      child: const Text('Bước tiếp theo'),
    );
  }
}
