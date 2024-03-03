import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:flutter/material.dart';

class SleepModeTimeBox extends StatelessWidget {
  final String title;

  const SleepModeTimeBox({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContentHeader(
      title: title,
      child: Container(),
    );
  }
}
