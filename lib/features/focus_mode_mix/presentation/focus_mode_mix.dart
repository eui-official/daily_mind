import 'package:flutter/material.dart';

class FocusModeMix extends StatelessWidget {
  const FocusModeMix({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.music_note),
      label: const Text('Chọn âm thanh'),
    );
  }
}
