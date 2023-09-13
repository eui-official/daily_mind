import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixEditorAddButton extends HookConsumerWidget {
  final VoidCallback onPressed;

  const NewMixEditorAddButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 48),
      ),
      child: Text('createNewMix'.tr()),
    );
  }
}
