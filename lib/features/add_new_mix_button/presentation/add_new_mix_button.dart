import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class AddNewMixButton extends HookWidget {
  const AddNewMixButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onOpenCreateNewMix = useCallback(
      () {
        context.push('/new-mix');
      },
      [],
    );

    return ElevatedButton.icon(
      key: addNewMixKey,
      onPressed: onOpenCreateNewMix,
      icon: const Icon(Icons.playlist_add),
      label: Text('createNewMix'.tr()),
    );
  }
}
