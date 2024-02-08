import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/widgets.dart';

class OnlineCategoryVerticalContent extends StatelessWidget {
  final String name;

  const OnlineCategoryVerticalContent({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
