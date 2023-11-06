import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FocusModeNewSessionButton extends HookWidget {
  const FocusModeNewSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onOpenCreateNewSession = useCallback(
      () {},
      [],
    );

    return ElevatedButton(
      onPressed: onOpenCreateNewSession,
      child: Text('focusCreateNewSession'.tr()),
    );
  }
}
