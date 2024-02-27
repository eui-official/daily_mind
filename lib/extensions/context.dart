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
        stops: const [
          0,
          0.6,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );

  LinearGradient get baseBackgroundLinearGradient => LinearGradient(
        colors: [
          theme.primaryColor.withOpacity(0.1),
          theme.colorScheme.background.withOpacity(.5),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      );
}
