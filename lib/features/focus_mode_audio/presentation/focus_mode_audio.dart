import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FocusModeAudio extends HookWidget {
  const FocusModeAudio({super.key});

  @override
  Widget build(BuildContext context) {
    final onOpenMixCollections = useCallback(
      () {},
      [],
    );

    return ElevatedButton.icon(
      onPressed: onOpenMixCollections,
      icon: const Icon(Icons.music_note),
      label: const Text('Chọn âm thanh'),
    );
  }
}
