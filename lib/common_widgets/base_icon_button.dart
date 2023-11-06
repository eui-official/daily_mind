import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseIconButton extends StatelessWidget {
  final String icon;

  const BaseIconButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        spacing(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          spacing(5),
        ),
        onTap: () {},
        child: Container(
          height: spacing(10),
          width: spacing(10),
          alignment: Alignment.center,
          child: ImageIcon(
            AssetImage(icon),
          ),
        ),
      ),
    );
  }
}
