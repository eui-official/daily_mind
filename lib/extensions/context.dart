import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get primaryColorDark50 => theme.primaryColorDark.withOpacity(0.5);

  Future onShowPopover(String content) {
    return showPopover(
      backgroundColor: theme.colorScheme.background,
      context: this,
      width: width * 0.7,
      bodyBuilder: (context) => BaseSpacingContainer(
        child: Text(
          content,
          style: context.textTheme.bodySmall,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  LinearGradient get baseLinearGradient => LinearGradient(
        colors: [
          theme.colorScheme.background.withOpacity(.4),
          theme.colorScheme.background.withOpacity(.2),
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      );

  LinearGradient get baseBackgroundLinearGradient => LinearGradient(
        colors: [
          theme.primaryColorDark.withOpacity(.1),
          theme.colorScheme.background,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
