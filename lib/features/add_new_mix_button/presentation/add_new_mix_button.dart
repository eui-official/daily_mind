import 'package:daily_mind/theme/theme.dart';
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

    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing(5)),
      ),
      onPressed: onOpenCreateNewMix,
      child: const Icon(Icons.playlist_add),
    );
  }
}
