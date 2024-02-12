import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:popover/popover.dart';

class OnlinePlayerDetailsShowCategoryDescription extends HookWidget {
  final String description;

  const OnlinePlayerDetailsShowCategoryDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final onShowDescription = useCallback(
      () async {
        await showPopover(
          backgroundColor: context.theme.colorScheme.background,
          context: context,
          width: context.width * 0.7,
          bodyBuilder: (context) => BaseSpacingContainer(
            child: Text(
              description,
              style: context.textTheme.bodySmall,
              textAlign: TextAlign.justify,
            ),
          ),
        );
      },
      [description],
    );

    return BaseIconButtonWithTitle(
      iconData: Icons.info_outline_rounded,
      onPressed: onShowDescription,
    );
  }
}
