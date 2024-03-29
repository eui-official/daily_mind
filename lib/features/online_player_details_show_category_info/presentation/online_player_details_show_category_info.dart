import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlayerDetailsShowCategoryDescription extends HookWidget {
  final String description;

  const OnlinePlayerDetailsShowCategoryDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final onShowDescription = useCallback(
      () {
        context.onShowPopover(description);
      },
      [description],
    );

    return BaseIconButtonWithTitle(
      iconData: Icons.info_outline_rounded,
      onPressed: onShowDescription,
    );
  }
}
