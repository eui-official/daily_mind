import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';

class BaseNullBuilder<T> extends StatelessWidget {
  final T? value;
  final OnEmptyWidgetBuilder<T> builder;

  const BaseNullBuilder({
    super.key,
    required this.value,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final currentValue = value;

    if (currentValue != null) {
      return builder(currentValue);
    }

    return emptyWidget;
  }
}
