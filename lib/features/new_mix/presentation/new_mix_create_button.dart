import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixCreateButton extends HookConsumerWidget {
  const NewMixCreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    final onPressed = useCallback(
      () {
        context.push('/mix-editor');
      },
      [],
    );

    return ElevatedButton(
      onPressed: newMixSelectedState.isNoSound ? empty : onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 48),
      ),
      child: Text('nextStep'.tr()),
    );
  }
}
