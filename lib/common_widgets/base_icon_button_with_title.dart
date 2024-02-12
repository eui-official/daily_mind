import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseIconButtonWithTitle extends HookWidget {
  final Color? backgroundColor;
  final String? title;
  final IconData iconData;
  final VoidCallback onPressed;

  const BaseIconButtonWithTitle({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.backgroundColor,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() {
      final currentTitle = title;

      final List<Widget> contents = [
        Icon(iconData),
        if (currentTitle != null)
          Text(
            currentTitle,
            style: context.textTheme.bodySmall,
          ),
      ];

      return contents;
    }, [iconData, title]);

    return BaseInkWell(
      onTap: onPressed,
      borderRadius: circularRadius(2),
      color: backgroundColor ?? context.theme.primaryColorDark,
      child: Container(
        padding: EdgeInsets.all(spacing()),
        child: Row(
          children: space(
            children,
            width: spacing(),
          ),
        ),
      ),
    );
  }
}
