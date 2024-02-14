import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlayerAudioInfo extends HookWidget {
  final String description;

  const OnlinePlayerAudioInfo({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final onShowInfo = useCallback(
      () {
        context.onShowPopover(description);
      },
      [description],
    );

    return IconButton(
      onPressed: onShowInfo,
      icon: const Icon(Icons.info_rounded),
    );
  }
}
